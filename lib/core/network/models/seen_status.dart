import 'package:json_annotation/json_annotation.dart';

enum SeenStatus {
  @JsonValue('SEEN')
  seen,
  @JsonValue('NOT_SEEN')
  notSeen,
  @JsonValue('COMPLETED')
  completed,
}
