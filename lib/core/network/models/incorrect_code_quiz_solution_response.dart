import 'package:json_annotation/json_annotation.dart';

part 'incorrect_code_quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class IncorrectCodeQuizSolutionResponse {
  IncorrectCodeQuizSolutionResponse(
    this.incorrectSolutionIndex,
    this.incorrectAnswer,
    this.correctSolution,
  );

  factory IncorrectCodeQuizSolutionResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$IncorrectCodeQuizSolutionResponseFromJson(json);
  final int incorrectSolutionIndex;
  final String incorrectAnswer;
  final String correctSolution;
}
