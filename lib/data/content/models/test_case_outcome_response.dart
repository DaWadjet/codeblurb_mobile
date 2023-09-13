import 'package:codeblurb_mobile/data/models/test_case_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_case_outcome_response.g.dart';

@JsonSerializable(createToJson: false)
class TestCaseOutcomeResponse {
  TestCaseOutcomeResponse(this.expected, this.actual, this.outcome, this.hints);

  factory TestCaseOutcomeResponse.fromJson(Map<String, dynamic> json) =>
      _$TestCaseOutcomeResponseFromJson(json);
  final String expected;
  final String actual;
  final TestCaseResult outcome;

  final List<String> hints;
}
