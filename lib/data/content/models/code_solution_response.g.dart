// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_solution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeSolutionResponse _$CodeSolutionResponseFromJson(
        Map<String, dynamic> json) =>
    CodeSolutionResponse(
      (json['results'] as List<dynamic>)
          .map((e) =>
              TestCaseOutcomeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecode(_$OverallResultEnumMap, json['overallResult']),
    );

const _$OverallResultEnumMap = {
  OverallResult.allPassed: 'ALL_PASSED',
  OverallResult.someFailed: 'TESTCASES_FAILED',
};
