import 'package:json_annotation/json_annotation.dart';

enum ContentType {
  @JsonValue('CODING')
  coding,
  @JsonValue('VIDEO')
  video,
  @JsonValue('QUIZ')
  quiz,
}
