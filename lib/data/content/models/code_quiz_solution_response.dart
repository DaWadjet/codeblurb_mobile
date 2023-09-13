import 'package:codeblurb_mobile/data/content/models/incorrect_code_quiz_solution_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code_quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class CodeQuizSolutionResponse {
  CodeQuizSolutionResponse(this.correctAnswerIndices, this.incorrectSolutions);

  factory CodeQuizSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeQuizSolutionResponseFromJson(json);
  final List<int> correctAnswerIndices;
  final List<IncorrectCodeQuizSolutionResponse> incorrectSolutions;
}
