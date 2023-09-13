import 'package:codeblurb_mobile/core/app_constants.dart';
import 'package:codeblurb_mobile/core/core_providers.dart';
import 'package:codeblurb_mobile/data/auth/auth_api.dart';
import 'package:codeblurb_mobile/data/auth/models/login_request.dart';
import 'package:codeblurb_mobile/data/auth/models/login_response.dart';
import 'package:codeblurb_mobile/data/auth/models/refresh_token_request.dart';
import 'package:codeblurb_mobile/data/auth/models/refresh_token_response.dart';
import 'package:codeblurb_mobile/data/auth/models/register_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepoProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.watch(authApiProvider),
    ref.watch(sharedPrefsProvider),
  ),
  name: 'Auth Repository Provider',
);

class AuthRepository {
  AuthRepository(this._authApi, this._sharedPreferences);
  final AuthApi _authApi;
  final SharedPreferences _sharedPreferences;

  Future<void> register({
    required String username,
    required String password,
  }) async {
    await _authApi.register(
      RegisterRequest(username, password),
    );
    await login(username: username, password: password);
  }

  Future<void> refreshToken() async {
    final response = await _authApi.refreshToken(
      RefreshTokenRequest(
        _sharedPreferences.getString(AppConstants.refreshToken) ?? '',
      ),
    );
    final refreshResponse = RefreshTokenResponse.fromJson(response.data!);
    await _saveTokens(
      access: refreshResponse.accessToken,
      refresh: refreshResponse.refreshToken,
    );
  }

  Future<void> logout() async {
    await _authApi.logout();
    await _clearTokens();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await _authApi.login(LoginRequest(username, password));
    final loginResponse = LoginResponse.fromJson(response.data!);
    await _saveTokens(
      access: loginResponse.accessToken,
      refresh: loginResponse.refreshToken,
    );
  }

  Future<void> forceLogout() async {
    await _authApi.forceLogout();
    await _clearTokens();
  }

  Future<void> _saveTokens({required String access, required String refresh}) {
    return Future.wait([
      _sharedPreferences.setString(AppConstants.accessToken, access),
      _sharedPreferences.setString(AppConstants.refreshToken, refresh),
    ]);
  }

  Future<void> _clearTokens() {
    return Future.wait([
      _sharedPreferences.remove(AppConstants.accessToken),
      _sharedPreferences.remove(AppConstants.refreshToken),
    ]);
  }
}
