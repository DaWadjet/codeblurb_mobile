// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_case_outcome_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCaseOutcomeResponse _$TestCaseOutcomeResponseFromJson(
        Map<String, dynamic> json) =>
    TestCaseOutcomeResponse(
      json['testCaseId'] as int,
      json['expected'] as String,
      json['actual'] as String,
      json['errors'] as String?,
      $enumDecode(_$OutcomeEnumMap, json['outcome']),
    );

const _$OutcomeEnumMap = {
  Outcome.passed: 'PASSED',
  Outcome.failed: 'FAILED',
};
