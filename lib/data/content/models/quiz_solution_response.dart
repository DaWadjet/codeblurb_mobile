import 'package:codeblurb_mobile/data/content/models/incorrect_quiz_solution_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizSolutionResponse {
  QuizSolutionResponse(
    this.correctlyAnsweredQuestionIds,
    this.incorrectSolutions,
  );

  factory QuizSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizSolutionResponseFromJson(json);
  @JsonKey(name: 'correctAnswerQuestionIds')
  final List<int> correctlyAnsweredQuestionIds;
  final List<IncorrectQuizSolutionResponse> incorrectSolutions;
}
