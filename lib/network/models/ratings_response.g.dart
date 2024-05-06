// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingsResponse _$RatingsResponseFromJson(Map<String, dynamic> json) =>
    RatingsResponse(
      (json['ratings'] as List<dynamic>)
          .map((e) => RatingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['averageRating'] as num?)?.toDouble(),
      json['numberOfRatings'] as int,
    );
