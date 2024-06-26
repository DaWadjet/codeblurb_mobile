import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';

class ProgressApi {
  ProgressApi(this._dio);

  final Dio _dio;

  ApiResponse markAsSeen(int contentId) async {
    return _dio.patch('/content/progress/seen/$contentId');
  }

  ApiResponse markAsCompleted(int contentId) async {
    return _dio.patch('/content/progress/completed/$contentId');
  }
}
