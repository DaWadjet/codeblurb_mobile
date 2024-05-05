// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_solution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeSolutionResponse _$CodeSolutionResponseFromJson(
        Map<String, dynamic> json) =>
    CodeSolutionResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              TestCaseOutcomeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      runId: json['runId'] as String,
      compilationErrors: json['compilationErrors'] as String?,
      codingContentId: json['codingContentId'] as int,
      outcome: $enumDecode(_$OutcomeEnumMap, json['outcome']),
    );

const _$OutcomeEnumMap = {
  Outcome.passed: 'PASSED',
  Outcome.failed: 'FAILED',
};
