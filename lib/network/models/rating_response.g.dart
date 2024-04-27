// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) =>
    RatingResponse(
      json['username'] as String,
      json['rating'] as int,
      json['comment'] as String,
      DateTime.parse(json['createdAt'] as String),
    );
