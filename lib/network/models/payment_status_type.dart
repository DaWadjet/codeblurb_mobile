import 'package:json_annotation/json_annotation.dart';

enum PaymentStatusType {
  @JsonValue('PAID')
  paid,
  @JsonValue('PENDING')
  pending,
  @JsonValue('FAILED')
  failed,
}
