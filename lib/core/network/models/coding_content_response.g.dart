// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coding_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodingContentResponse _$CodingContentResponseFromJson(
        Map<String, dynamic> json) =>
    CodingContentResponse(
      json['id'] as int,
      json['name'] as String,
      $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      $enumDecode(_$SeenStatusEnumMap, json['status']),
      json['estimatedTime'] as int,
      json['shortDescription'] as String,
      json['order'] as int?,
      json['description'] as String,
      $enumDecode(_$CodingContentTypeEnumMap, json['codingContentType']),
      (json['codeSnippets'] as List<dynamic>).map((e) => e as String).toList(),
      (json['codeSkeleton'] as List<dynamic>).map((e) => e as String).toList(),
      json['testCases'] as List<dynamic>,
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

const _$CodingContentTypeEnumMap = {
  CodingContentType.scratch: 'SCRATCH',
  CodingContentType.dragAndDrop: 'DRAG_AND_DROP',
  CodingContentType.fillInTheGaps: 'FILL_THE_GAP',
};
