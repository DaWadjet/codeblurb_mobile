import 'package:json_annotation/json_annotation.dart';

enum TestCaseResult {
  @JsonValue('PASSED')
  passed,
  @JsonValue('FAILED')
  failed
}
