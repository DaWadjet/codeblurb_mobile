// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'separated_content_bundle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeparatedContentBundleResponse _$SeparatedContentBundleResponseFromJson(
        Map<String, dynamic> json) =>
    SeparatedContentBundleResponse(
      (json['includedVideos'] as List<dynamic>)
          .map((e) => VideoContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['includedCodings'] as List<dynamic>)
          .map((e) => CodingContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['includedQuizzes'] as List<dynamic>)
          .map((e) => QuizContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
