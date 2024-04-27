import 'package:json_annotation/json_annotation.dart';

part 'code_quiz_solution_request.g.dart';

@JsonSerializable(createFactory: false)
class CodeQuizSolutionRequest {
  CodeQuizSolutionRequest(this.solutionsInOrder);
  final List<String> solutionsInOrder;

  Map<String, dynamic> toJson() => _$CodeQuizSolutionRequestToJson(this);
}
