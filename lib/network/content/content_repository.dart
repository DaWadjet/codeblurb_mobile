import 'package:codeblurb_mobile/network/content/content_api.dart';
import 'package:codeblurb_mobile/network/models/code_quiz_solution_request.dart';
import 'package:codeblurb_mobile/network/models/code_quiz_solution_response.dart';
import 'package:codeblurb_mobile/network/models/code_solution_request.dart';
import 'package:codeblurb_mobile/network/models/code_solution_response.dart';
import 'package:codeblurb_mobile/network/models/page_minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/network/models/quiz_question_solution_request_item.dart';
import 'package:codeblurb_mobile/network/models/quiz_solution_request.dart';
import 'package:codeblurb_mobile/network/models/quiz_solution_response.dart';
import 'package:codeblurb_mobile/network/models/separated_content_bundle_response.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';

class ContentRepository {
  ContentRepository(this._contentApi);
  final ContentApi _contentApi;

  Future<QuizSolutionResponse> sendQuizSolution({
    required int contentId,
    required List<QuizQestionSolutionRequestItem> answers,
  }) async {
    final response = await _contentApi.sendQuizSolution(
      contentId: contentId,
      request: QuizSolutionRequest(
        answers,
      ),
    );
    return QuizSolutionResponse.fromJson(response.data!);
  }

  Future<CodeSolutionResponse> sendCodeSolution({
    required int contentId,
    required String code,
  }) async {
    final response = await _contentApi.sendCodeSolution(
      contentId: contentId,
      request: CodeSolutionRequest(
        code,
      ),
    );
    return CodeSolutionResponse.fromJson(response.data!);
  }

  Future<CodeQuizSolutionResponse> sendCodeQuizSolutionResultFor({
    required int contentId,
    required List<String> solutions,
  }) async {
    final response = await _contentApi.sendCodeQuizSolution(
      contentId: contentId,
      request: CodeQuizSolutionRequest(solutions),
    );
    return CodeQuizSolutionResponse.fromJson(
      response.data!,
    );
  }

  Future<PagedMinimalContentBundleResponse> getContentBundles(
    PageProps props,
  ) async {
    final response =
        await _contentApi.getContentBundles(props.toQueryParameters());
    return PagedMinimalContentBundleResponse.fromJson(response.data!);
  }

  Future<SeparatedContentBundleResponse> getContentBundle(int contentId) async {
    final response = await _contentApi.getContentBundle(contentId);
    return SeparatedContentBundleResponse.fromJson(response.data!);
  }
}
