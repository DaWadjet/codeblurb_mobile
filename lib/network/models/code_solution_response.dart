import 'package:json_annotation/json_annotation.dart';

part 'code_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class CodeSolutionResponse {
  CodeSolutionResponse(this.results, this.overallResult);

  factory CodeSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeSolutionResponseFromJson(json);

  //TODO specify the type of results properly
  final List<dynamic> results;
  final String overallResult;
}
