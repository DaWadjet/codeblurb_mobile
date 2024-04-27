import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(createToJson: false)
class ErrorResponse {
  ErrorResponse(this.errorMessage);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  final String errorMessage;
}
