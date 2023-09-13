// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_case_outcome_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCaseOutcomeResponse _$TestCaseOutcomeResponseFromJson(
        Map<String, dynamic> json) =>
    TestCaseOutcomeResponse(
      json['expected'] as String,
      json['actual'] as String,
      $enumDecode(_$TestCaseResultEnumMap, json['outcome']),
      (json['hints'] as List<dynamic>).map((e) => e as String).toList(),
    );

const _$TestCaseResultEnumMap = {
  TestCaseResult.passed: 'PASSED',
  TestCaseResult.failed: 'FAILED',
};
