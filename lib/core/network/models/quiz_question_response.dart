import 'package:json_annotation/json_annotation.dart';

part 'quiz_question_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizQuestionResponse {
  QuizQuestionResponse(
    this.id,
    this.question,
    this.answers,
    this.solutionIndex,
  );

  factory QuizQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionResponseFromJson(json);

  final int id;
  final String question;
  final List<String> answers;
  final int solutionIndex;
}
