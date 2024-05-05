import 'package:json_annotation/json_annotation.dart';

part 'test_case_response.g.dart';

@JsonSerializable(createToJson: false)
class TestCaseResponse {
  TestCaseResponse(
    this.input,
    this.expectedOutput,
  );

  factory TestCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$TestCaseResponseFromJson(json);

  final String expectedOutput;
  final String input;
}
