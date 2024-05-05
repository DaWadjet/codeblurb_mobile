import 'package:json_annotation/json_annotation.dart';

enum Outcome {
  @JsonValue('PASSED')
  passed('Passed'),
  @JsonValue('FAILED')
  failed('Failed');

  const Outcome(this.value);
  final String value;
}
