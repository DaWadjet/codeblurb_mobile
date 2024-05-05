// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'separated_content_bundle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeparatedContentBundleResponse _$SeparatedContentBundleResponseFromJson(
        Map<String, dynamic> json) =>
    SeparatedContentBundleResponse(
      json['id'] as int,
      json['description'] as String,
      json['title'] as String,
      json['imageUrl'] as String?,
      $enumDecode(_$SkillLevelEnumMap, json['skillLevel']),
      (json['progress'] as num).toDouble(),
      DateTime.parse(json['releaseDate'] as String),
      json['ratings'] == null
          ? null
          : RatingsResponse.fromJson(json['ratings'] as Map<String, dynamic>),
      json['numberOfPurchases'] as int,
      (json['includedCodings'] as List<dynamic>)
          .map((e) => CodingContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['includedQuizzes'] as List<dynamic>)
          .map((e) => QuizContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['includedVideos'] as List<dynamic>)
          .map((e) => VideoContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['includedArticles'] as List<dynamic>)
          .map(
              (e) => ArticleContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$SkillLevelEnumMap = {
  SkillLevel.beginner: 'BEGINNER',
  SkillLevel.intermediate: 'INTERMEDIATE',
  SkillLevel.advanced: 'ADVANCED',
};
