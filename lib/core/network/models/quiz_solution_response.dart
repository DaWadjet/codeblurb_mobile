import 'package:codeblurb_mobile/core/network/models/incorrect_quiz_solution_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizSolutionResponse {
  QuizSolutionResponse(
    this.correctAnswerQuestionIds,
    this.incorrectSolutions,
  );

  factory QuizSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizSolutionResponseFromJson(json);

  final List<int> correctAnswerQuestionIds;
  final List<IncorrectQuizSolutionResponse> incorrectSolutions;
}
