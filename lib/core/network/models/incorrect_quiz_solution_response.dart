import 'package:json_annotation/json_annotation.dart';

part 'incorrect_quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class IncorrectQuizSolutionResponse {
  IncorrectQuizSolutionResponse(
    this.incorrectQuestionId,
    this.incorrectSolutionSent,
    this.correctSolution,
  );

  factory IncorrectQuizSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$IncorrectQuizSolutionResponseFromJson(json);
  final int incorrectQuestionId;
  final int incorrectSolutionSent;
  final int correctSolution;
}
