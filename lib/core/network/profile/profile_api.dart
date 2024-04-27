import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:codeblurb_mobile/core/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileApiProvider = Provider<ProfileApi>(
  (ref) => ProfileApi(ref.watch(dioProvider)),
  name: 'Profile API Provider',
);

class ProfileApi {
  ProfileApi(this._dio);

  final Dio _dio;

  ApiResponse getProfile() async {
    return _dio.get('/');
  }
}
