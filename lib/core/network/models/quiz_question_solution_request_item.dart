import 'package:json_annotation/json_annotation.dart';

part 'quiz_question_solution_request_item.g.dart';

@JsonSerializable(createFactory: false)
class QuizQestionSolutionRequestItem {
  QuizQestionSolutionRequestItem(this.questionId, this.answerIndex);

  final int questionId;
  final int answerIndex;

  Map<String, dynamic> toJson() => _$QuizQestionSolutionRequestItemToJson(this);
}
