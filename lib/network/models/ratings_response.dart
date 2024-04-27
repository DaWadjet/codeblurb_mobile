import 'package:codeblurb_mobile/network/models/rating_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ratings_response.g.dart';

@JsonSerializable(createToJson: false)
class RatingsResponse {
  RatingsResponse(this.ratings, this.averageRating, this.numberOfRatings);

  factory RatingsResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingsResponseFromJson(json);

  final List<RatingResponse> ratings;
  final double averageRating;
  final int numberOfRatings;
}
