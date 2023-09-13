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
      json['description'] as String,
      (json['codeSkeleton'] as List<dynamic>).map((e) => e as String).toList(),
      (json['codeSnippets'] as List<dynamic>).map((e) => e as String).toList(),
      (json['testCases'] as List<dynamic>)
          .map((e) => TestCaseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecode(_$CodingContentTypeEnumMap, json['codingContentType']),
    );

const _$CodingContentTypeEnumMap = {
  CodingContentType.scratch: 'SCRATCH',
  CodingContentType.dragAndDrop: 'DRAG_AND_DROP',
  CodingContentType.fillInTheGaps: 'FILL_THE_GAP',
};
