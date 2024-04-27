import 'package:json_annotation/json_annotation.dart';

enum TokenType {
  @JsonValue('accessToken')
  access,
  @JsonValue('refreshToken')
  refresh
}
