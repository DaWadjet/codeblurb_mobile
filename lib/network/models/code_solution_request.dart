import 'package:json_annotation/json_annotation.dart';

part 'code_solution_request.g.dart';

@JsonSerializable(createFactory: false)
class CodeSolutionRequest {
  CodeSolutionRequest(this.code);
  final String code;

  Map<String, dynamic> toJson() => _$CodeSolutionRequestToJson(this);
}
