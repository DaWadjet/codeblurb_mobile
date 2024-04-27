import 'package:json_annotation/json_annotation.dart';

enum SkillLevel {
  @JsonValue('BEGINNER')
  begnner,
  @JsonValue('INTERMEDIATE')
  intermediate,
  @JsonValue('ADVANCED')
  failed,
}
