// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleContentResponse _$ArticleContentResponseFromJson(
        Map<String, dynamic> json) =>
    ArticleContentResponse(
      json['id'] as int,
      json['name'] as String,
      $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      $enumDecode(_$SeenStatusEnumMap, json['status']),
      json['estimatedTime'] as int,
      json['shortDescription'] as String,
      json['order'] as int?,
      json['markdownText'] as String,
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
