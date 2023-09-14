import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequest {
  LoginRequest(this.username, this.password);
  final String username;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
