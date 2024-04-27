import 'package:codeblurb_mobile/network/dio.dart';
import 'package:codeblurb_mobile/network/models/code_quiz_solution_request.dart';
import 'package:codeblurb_mobile/network/models/code_solution_request.dart';
import 'package:codeblurb_mobile/network/models/quiz_solution_request.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentApiProvider = Provider<ContentApi>(
  (ref) => ContentApi(ref.watch(dioProvider)),
  name: 'Content API Provider',
);

class ContentApi {
  ContentApi(this._dio);

  final Dio _dio;

  ApiResponse sendQuizSolution({
    required int contentId,
    required QuizSolutionRequest request,
  }) async {
    return _dio.post(
      '/content/quiz/solution/$contentId',
      data: request.toJson(),
    );
  }

  ApiResponse sendCodeSolution({
    required int contentId,
    required CodeSolutionRequest request,
  }) async {
    return _dio.post(
      '/content/code/scratch-solution/$contentId',
      data: request.toJson(),
    );
  }

  ApiResponse sendCodeQuizSolution({
    required int contentId,
    required CodeQuizSolutionRequest request,
  }) async {
    return _dio.post(
      '/content/code/code-quiz-solution/$contentId',
      data: request.toJson(),
    );
  }

  //TODO: add paging params
  ApiResponse getContentBundles() async {
    return _dio.get('/content/content-bundles');
  }

  ApiResponse getContentBundle(int contentId) async {
    return _dio.get('/content/content-bundles/$contentId');
  }
}
