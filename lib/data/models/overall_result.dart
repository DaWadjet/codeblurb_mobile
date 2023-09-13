import 'package:json_annotation/json_annotation.dart';

enum OverallResult {
  @JsonValue('ALL_PASSED')
  allPassed,
  @JsonValue('TESTCASES_FAILED')
  someFailed
}
