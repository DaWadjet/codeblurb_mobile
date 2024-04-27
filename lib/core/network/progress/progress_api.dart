import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:codeblurb_mobile/core/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressApiProvider = Provider<ProgressApi>(
  (ref) => ProgressApi(ref.watch(dioProvider)),
  name: 'Progress API Provider',
);

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
