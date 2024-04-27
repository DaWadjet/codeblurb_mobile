import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable(createToJson: false)
class ProfileResponse {
  ProfileResponse(
    this.username,
    this.email,
    this.registeredAt,
  );

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  final String username;
  final String email;
  final DateTime registeredAt;
}
