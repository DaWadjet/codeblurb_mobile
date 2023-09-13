// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_quiz_solution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeQuizSolutionResponse _$CodeQuizSolutionResponseFromJson(
        Map<String, dynamic> json) =>
    CodeQuizSolutionResponse(
      (json['correctAnswerIndices'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      (json['incorrectSolutions'] as List<dynamic>)
          .map((e) => IncorrectCodeQuizSolutionResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
