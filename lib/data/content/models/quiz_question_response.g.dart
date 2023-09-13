// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizQuestionResponse _$QuizQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    QuizQuestionResponse(
      json['id'] as int,
      json['question'] as String,
      (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      json['solutionIndex'] as int,
      json['solutionChar'] as String,
    );
