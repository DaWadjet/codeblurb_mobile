// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_solution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizSolutionResponse _$QuizSolutionResponseFromJson(
        Map<String, dynamic> json) =>
    QuizSolutionResponse(
      (json['correctAnswerQuestionIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      (json['incorrectSolutions'] as List<dynamic>)
          .map((e) =>
              IncorrectQuizSolutionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
