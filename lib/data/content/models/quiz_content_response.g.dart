// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizContentResponse _$QuizContentResponseFromJson(Map<String, dynamic> json) =>
    QuizContentResponse(
      json['id'] as int,
      json['name'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
