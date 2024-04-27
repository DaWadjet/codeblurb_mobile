import 'package:codeblurb_mobile/network/models/quiz_question_solution_request_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_solution_request.g.dart';

@JsonSerializable(createFactory: false)
class QuizSolutionRequest {
  QuizSolutionRequest(this.solutions);
  final List<QuizQestionSolutionRequestItem> solutions;

  Map<String, dynamic> toJson() => _$QuizSolutionRequestToJson(this);
}
