import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:codeblurb_mobile/data/auth/models/login_request.dart';
import 'package:codeblurb_mobile/data/auth/models/refresh_token_request.dart';
import 'package:codeblurb_mobile/data/auth/models/register_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(ref.watch(dioProvider)),
  name: 'Auth API Provider',
);

class AuthApi {
  AuthApi(this._dio);

  final Dio _dio;

  Future<Response<Map<String, dynamic>>> register(
      RegisterRequest request,) async {
    return _dio.post('/auth/register', data: request.toJson());
  }

  Future<Response<Map<String, dynamic>>> refreshToken(
      RefreshTokenRequest request,) async {
    return _dio.post('/auth/refresh', data: request.toJson());
  }

  Future<Response<Map<String, dynamic>>> logout() async {
    return _dio.post('/auth/logout');
  }

  Future<Response<Map<String, dynamic>>> login(LoginRequest request) async {
    return _dio.post('/auth/login', data: request.toJson());
  }

  Future<Response<Map<String, dynamic>>> forceLogout() async {
    return _dio.post('/auth/force-logout');
  }
}
