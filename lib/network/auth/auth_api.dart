import 'package:codeblurb_mobile/network/models/change_password_request.dart';
import 'package:codeblurb_mobile/network/models/forgot_password_request.dart';
import 'package:codeblurb_mobile/network/models/login_request.dart';
import 'package:codeblurb_mobile/network/models/refresh_token_request.dart';
import 'package:codeblurb_mobile/network/models/register_request.dart';
import 'package:codeblurb_mobile/network/models/reset_password_request.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';

class AuthApi {
  AuthApi(this._dio);

  final Dio _dio;

  ApiResponse resetPassword(
    ResetPasswordRequest request,
  ) async {
    return _dio.post('/auth/reset-password', data: request.toJson());
  }

  ApiResponse register(
    RegisterRequest request,
  ) async {
    return _dio.post('/auth/register', data: request.toJson());
  }

  ApiResponse refreshToken(
    RefreshTokenRequest request,
  ) async {
    return _dio.post('/auth/refresh', data: request.toJson());
  }

  ApiResponse forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    return _dio.post('/auth/forgot-password', data: request.toJson());
  }

  ApiResponse logout() async {
    return _dio.post('/auth/logout');
  }

  ApiResponse login(LoginRequest request) async {
    return _dio.post('/auth/login', data: request.toJson());
  }

  ApiResponse forceLogout() async {
    return _dio.post('/auth/force-logout');
  }

  ApiResponse changePassword(
    ChangePasswordRequest request,
  ) async {
    return _dio.post('/auth/change-password', data: request.toJson());
  }
}
