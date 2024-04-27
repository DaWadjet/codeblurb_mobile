import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ForgotPasswordRequest {
  ForgotPasswordRequest(this.username);
  final String username;

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
