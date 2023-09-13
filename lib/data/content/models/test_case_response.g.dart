// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_case_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCaseResponse _$TestCaseResponseFromJson(Map<String, dynamic> json) =>
    TestCaseResponse(
      json['input'] as String,
      json['expectedOutput'] as String,
    );

Map<String, dynamic> _$TestCaseResponseToJson(TestCaseResponse instance) =>
    <String, dynamic>{
      'input': instance.input,
      'expectedOutput': instance.expectedOutput,
    };
