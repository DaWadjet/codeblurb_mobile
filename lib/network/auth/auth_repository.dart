import 'package:codeblurb_mobile/app_constants.dart';
import 'package:codeblurb_mobile/network/auth/auth_api.dart';
import 'package:codeblurb_mobile/network/models/change_password_request.dart';
import 'package:codeblurb_mobile/network/models/forgot_password_request.dart';
import 'package:codeblurb_mobile/network/models/login_request.dart';
import 'package:codeblurb_mobile/network/models/login_response.dart';
import 'package:codeblurb_mobile/network/models/refresh_token_request.dart';
import 'package:codeblurb_mobile/network/models/register_request.dart';
import 'package:codeblurb_mobile/network/models/reset_password_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthRepository(this._authApi, this._sharedPreferences);
  final AuthApi _authApi;
  final SharedPreferences _sharedPreferences;

  Future<void> resetPassword({required String password}) async {
    await _authApi.resetPassword(ResetPasswordRequest(password));
  }

  Future<void> register({
    required String username,
    required String password,
    required String email,
  }) async {
    await _authApi.register(
      RegisterRequest(username, password, email),
    );
    await login(username: username, password: password);
  }

  Future<bool> refreshToken() async {
    final refreshToken =
        _sharedPreferences.getString(AppConstants.refreshToken);
    if (refreshToken == null) return false;
    try {
      final response = await _authApi.refreshToken(
        RefreshTokenRequest(
          refreshToken,
        ),
      );
      final refreshResponse = LoginResponse.fromJson(response.data!);
      await _saveTokens(
        access: refreshResponse.accessToken,
        refresh: refreshResponse.refreshToken,
      );
      return true;
    } catch (e) {
      await _clearTokens();
      return false;
    }
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

  Future<void> forgotPassword({required String username}) async {
    await _authApi.forgotPassword(ForgotPasswordRequest(username));
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await _authApi.changePassword(
      ChangePasswordRequest(oldPassword, newPassword),
    );
  }
}
