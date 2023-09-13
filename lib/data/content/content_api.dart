import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:codeblurb_mobile/data/content/models/code_quiz_solution_request.dart';
import 'package:codeblurb_mobile/data/content/models/code_solution_request.dart';
import 'package:codeblurb_mobile/data/content/models/quiz_solution_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentApiProvider = Provider<ContentApi>(
  (ref) => ContentApi(ref.watch(dioProvider)),
  name: 'Content API Provider',
);

class ContentApi {
  ContentApi(this._dio);

  final Dio _dio;

  Future<Response<Map<String, dynamic>>> sendQuizSolution({
    required int contentId,
    required QuizSolutionRequest body,
  }) async {
    return _dio.post(
      '/content/quiz/solution/$contentId',
      data: body.toJson(),
    );
  }

  Future<Response<Map<String, dynamic>>> sendCodeSolution({
    required int contentId,
    required CodeSolutionRequest body,
  }) async {
    return _dio.post(
      '/content/code/solution/$contentId',
      data: body.toJson(),
    );
  }

  Future<Response<Map<String, dynamic>>> sendCodeQuizSolution({
    required int contentId,
    required CodeQuizSolutionRequest body,
  }) async {
    return _dio.post(
      '/content/code/code-quiz-solution/$contentId',
      data: body.toJson(),
    );
  }

  Future<Response<Map<String, dynamic>>> getMyContent() async {
    return _dio.get('/content/my-content-bundles/separated');
  }
}
