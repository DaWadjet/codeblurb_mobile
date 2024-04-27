import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordRequest {
  ChangePasswordRequest(
    this.oldPassword,
    this.newPassword,
  );
  final String oldPassword;
  final String newPassword;

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
