import 'package:json_annotation/json_annotation.dart';

part 'incorrect_code_quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class IncorrectCodeQuizSolutionResponse {

  IncorrectCodeQuizSolutionResponse(
      this.incorrectSolutionIndex, this.solutionSent, this.correctSolution,);

  factory IncorrectCodeQuizSolutionResponse.fromJson(
          Map<String, dynamic> json,) =>
      _$IncorrectCodeQuizSolutionResponseFromJson(json);
  final int incorrectSolutionIndex;
  @JsonKey(name: 'incorrectAnswer')
  final String solutionSent;
  final String correctSolution;
}
