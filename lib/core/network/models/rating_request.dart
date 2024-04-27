import 'package:json_annotation/json_annotation.dart';

part 'rating_request.g.dart';

@JsonSerializable(createFactory: false)
class RatingRequest {
  RatingRequest(this.rating, this.comment);
  final int rating;
  final String comment;

  Map<String, dynamic> toJson() => _$RatingRequestToJson(this);
}
