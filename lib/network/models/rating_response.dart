import 'package:json_annotation/json_annotation.dart';

part 'rating_response.g.dart';

@JsonSerializable(createToJson: false)
class RatingResponse {
  RatingResponse(
    this.username,
    this.rating,
    this.comment,
    this.createdAt,
  );

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  final String username;
  final int rating;
  final String comment;
  final DateTime createdAt;
}
