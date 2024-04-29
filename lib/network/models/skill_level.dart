import 'package:json_annotation/json_annotation.dart';

enum SkillLevel {
  @JsonValue('BEGINNER')
  beginner('Beginner'),
  @JsonValue('INTERMEDIATE')
  intermediate('Intermediate'),
  @JsonValue('ADVANCED')
  advanced('Advanced');

  const SkillLevel(this.value);
  final String value;
}
