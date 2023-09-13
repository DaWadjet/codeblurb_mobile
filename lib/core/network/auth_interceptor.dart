part of 'dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(
    this._preferences, {
    this.onUnauthorized,
  });

  final SharedPreferences _preferences;
  final void Function()? onUnauthorized;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = <String, String>{};
    final token = _preferences.getString(AppConstants.accessToken);
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    options.headers = headers;
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    if (statusCode != 401 && statusCode != 403) return handler.next(err);
    try {
      final refreshToken = _preferences.getString(AppConstants.refreshToken);
      if (refreshToken == null) return handler.reject(err);

      final reqOptions = err.requestOptions;
      final dio = Dio(BaseOptions(baseUrl: reqOptions.baseUrl))
        ..interceptors.addAll([
          PrettyDioLogger(requestBody: true),
        ]);
      final refreshResponse = await dio.post<Map<String, dynamic>>(
        '${reqOptions.baseUrl}/auth/refresh/',
        data: RefreshTokenRequest(refreshToken).toJson(),
      );
      if (refreshResponse.data == null) return handler.reject(err);

      final tokenResponse =
          RefreshTokenResponse.fromJson(refreshResponse.data!);
      await Future.wait([
        _preferences.setString(
          AppConstants.accessToken,
          tokenResponse.accessToken,
        ),
        _preferences.setString(
          AppConstants.refreshToken,
          tokenResponse.refreshToken,
        ),
      ]);

      final response = await _retryRequest(
        reqOptions: reqOptions,
        dio: dio,
        accessToken: tokenResponse.accessToken,
      );

      return handler.resolve(response);
    } catch (error) {
      onUnauthorized?.call();
      return handler.reject(err);
    }
  }

  Future<Response<Map<String, dynamic>>> _retryRequest({
    required RequestOptions reqOptions,
    required Dio dio,
    required String accessToken,
  }) {
    reqOptions.headers['Authorization'] = 'Bearer $accessToken';
    final options = Options(
      method: reqOptions.method,
      headers: reqOptions.headers,
    );
    return dio.request<Map<String, dynamic>>(
      reqOptions.uri.toString(),
      options: options,
      data: reqOptions.data,
      queryParameters: reqOptions.queryParameters,
    );
  }
}
