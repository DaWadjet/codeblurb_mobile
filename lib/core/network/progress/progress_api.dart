import 'package:codeblurb_mobile/core/types.dart';
import 'package:dio/dio.dart';

class ProgressApi {
  ProgressApi(this._dio);

  final Dio _dio;

  ApiResponse markAsSeen(int contentId) async {
    return _dio.patch('/seen/$contentId');
  }

  ApiResponse markAsCompleted(int contentId) async {
    return _dio.patch('/completed/$contentId');
  }
}
