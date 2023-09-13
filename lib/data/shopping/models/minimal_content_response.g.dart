// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimal_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimalContentResponse _$MinimalContentResponseFromJson(
        Map<String, dynamic> json) =>
    MinimalContentResponse(
      json['id'] as int,
      json['name'] as String,
      $enumDecode(_$ContentTypeEnumMap, json['contentType']),
    );

const _$ContentTypeEnumMap = {
  ContentType.coding: 'CODING',
  ContentType.video: 'VIDEO',
  ContentType.quiz: 'QUIZ',
};
