import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';

class ProfileApi {
  ProfileApi(this._dio);

  final Dio _dio;

  ApiResponse getProfile() async {
    return _dio.get('/');
  }
}
