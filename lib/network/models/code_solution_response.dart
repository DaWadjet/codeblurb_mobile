import 'package:codeblurb_mobile/network/models/outcome.dart';
import 'package:codeblurb_mobile/network/models/test_case_outcome_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class CodeSolutionResponse {
  CodeSolutionResponse({
    required this.results,
    required this.runId,
    required this.compilationErrors,
    required this.codingContentId,
    required this.outcome,
  });

  factory CodeSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeSolutionResponseFromJson(json);

  final List<TestCaseOutcomeResponse> results;
  final String runId;
  final String? compilationErrors;
  final int codingContentId;
  final Outcome outcome;
}
