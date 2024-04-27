import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequest {
  ResetPasswordRequest(this.password);
  final String password;

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
