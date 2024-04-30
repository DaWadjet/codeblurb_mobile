import 'package:json_annotation/json_annotation.dart';

enum TokenType {
  @JsonValue('accesstoken')
  access,
  @JsonValue('refreshtoken')
  refresh
}
