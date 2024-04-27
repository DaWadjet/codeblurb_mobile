// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoContentResponse _$VideoContentResponseFromJson(
        Map<String, dynamic> json) =>
    VideoContentResponse(
      json['id'] as int,
      json['name'] as String,
      $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      $enumDecode(_$SeenStatusEnumMap, json['status']),
      json['estimatedTime'] as int,
      json['shortDescription'] as String,
      json['order'] as int?,
      json['resourceUrl'] as String,
    );

const _$ContentTypeEnumMap = {
  ContentType.coding: 'CODING',
  ContentType.video: 'VIDEO',
  ContentType.quiz: 'QUIZ',
  ContentType.article: 'ARTICLE',
};

const _$SeenStatusEnumMap = {
  SeenStatus.seen: 'SEEN',
  SeenStatus.notSeen: 'NOT_SEEN',
  SeenStatus.completed: 'COMPLETED',
};
