import 'package:codeblurb_mobile/network/models/outcome.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_case_outcome_response.g.dart';

@JsonSerializable(createToJson: false)
class TestCaseOutcomeResponse {
  TestCaseOutcomeResponse(
    this.testCaseId,
    this.expected,
    this.actual,
    this.errors,
    this.outcome,
  );

  factory TestCaseOutcomeResponse.fromJson(Map<String, dynamic> json) =>
      _$TestCaseOutcomeResponseFromJson(json);

  final int testCaseId;
  final String expected;
  final String actual;
  final String? errors;
  final Outcome outcome;
}
