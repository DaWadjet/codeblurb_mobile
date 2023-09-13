import 'package:json_annotation/json_annotation.dart';

part 'incorrect_quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class IncorrectQuizSolutionResponse {

  IncorrectQuizSolutionResponse(
      this.questionId, this.solutionSent, this.correctSolution,);

  factory IncorrectQuizSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$IncorrectQuizSolutionResponseFromJson(json);
  @JsonKey(name: 'incorrectQuestionId')
  final int questionId;
  @JsonKey(name: 'incorrectSolutionSent')
  final int solutionSent;
  final int correctSolution;
}
