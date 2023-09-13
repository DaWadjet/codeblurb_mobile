import 'package:json_annotation/json_annotation.dart';

part 'test_case_response.g.dart';

@JsonSerializable()
class TestCaseResponse {

  TestCaseResponse(this.input, this.expectedOutput);

  factory TestCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$TestCaseResponseFromJson(json);
  final String input;
  final String expectedOutput;
  Map<String, dynamic> toJson() => _$TestCaseResponseToJson(this);
}
