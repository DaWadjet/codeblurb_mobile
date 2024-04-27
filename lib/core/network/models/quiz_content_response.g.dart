// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizContentResponse _$QuizContentResponseFromJson(Map<String, dynamic> json) =>
    QuizContentResponse(
      json['id'] as int,
      json['name'] as String,
      $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      $enumDecode(_$SeenStatusEnumMap, json['status']),
      json['estimatedTime'] as int,
      json['shortDescription'] as String,
      json['order'] as int?,
      (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
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
