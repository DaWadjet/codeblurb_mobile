import 'package:codeblurb_mobile/data/content/content_api.dart';
import 'package:codeblurb_mobile/data/content/models/code_quiz_solution_request.dart';
import 'package:codeblurb_mobile/data/content/models/code_quiz_solution_response.dart';
import 'package:codeblurb_mobile/data/content/models/code_solution_request.dart';
import 'package:codeblurb_mobile/data/content/models/code_solution_response.dart';
import 'package:codeblurb_mobile/data/content/models/quiz_solution_request.dart';
import 'package:codeblurb_mobile/data/content/models/quiz_solution_response.dart';
import 'package:codeblurb_mobile/data/models/my_content_bundles_separated_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentRepoProvider = Provider<ContentRepository>(
  (ref) => ContentRepository(ref.watch(contentApiProvider)),
  name: 'Content Repository Provider',
);

class ContentRepository {
  ContentRepository(this._contentApi);
  final ContentApi _contentApi;

  Future<QuizSolutionResponse> sendQuizSolution({
    required int contentId,
    required QuizSolutionRequest answers,
  }) async {
    final response = await _contentApi.sendQuizSolution(
      contentId: contentId,
      body: answers,
    );
    return QuizSolutionResponse.fromJson(response.data!);
  }

  Future<CodeSolutionResponse> sendCodeSolution({
    required int contentId,
    required CodeSolutionRequest codeSolution,
  }) async {
    final response = await _contentApi.sendCodeSolution(
      contentId: contentId,
      body: codeSolution,
    );
    return CodeSolutionResponse.fromJson(response.data!);
  }

  Future<CodeQuizSolutionResponse> getCodeQuizSolutionResultFor({
    required int contentId,
    required CodeQuizSolutionRequest solutions,
  }) async {
    final response = await _contentApi.sendCodeQuizSolution(
      contentId: contentId,
      body: solutions,
    );
    return CodeQuizSolutionResponse.fromJson(
      response.data!,
    );
  }

  Future<MyContentBundlesSeparatedResponse> getMyContent() async {
    final response = await _contentApi.getMyContent();
    return MyContentBundlesSeparatedResponse.fromJson(response.data!);
  }
}
