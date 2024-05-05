// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimal_content_bundle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimalContentBundleResponse _$MinimalContentBundleResponseFromJson(
        Map<String, dynamic> json) =>
    MinimalContentBundleResponse(
      (json['includedContent'] as List<dynamic>)
          .map(
              (e) => MinimalContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int,
      json['description'] as String,
      json['title'] as String,
      json['imageUrl'] as String?,
      $enumDecode(_$SkillLevelEnumMap, json['skillLevel']),
      (json['progress'] as num?)?.toDouble(),
      DateTime.parse(json['releaseDate'] as String),
      json['ratings'] == null
          ? null
          : RatingsResponse.fromJson(json['ratings'] as Map<String, dynamic>),
    );

const _$SkillLevelEnumMap = {
  SkillLevel.beginner: 'BEGINNER',
  SkillLevel.intermediate: 'INTERMEDIATE',
  SkillLevel.advanced: 'ADVANCED',
};
