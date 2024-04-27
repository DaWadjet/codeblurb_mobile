import 'package:json_annotation/json_annotation.dart';

part 'code_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  LoginResponse(this.results, this.overallResult);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  //TODO specify the type of results properly
  final List<dynamic> results;
  final String overallResult;
}
