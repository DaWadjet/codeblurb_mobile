import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequest {
  RegisterRequest(this.username, this.password);
  final String username;
  final String password;

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
