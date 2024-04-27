// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      $enumDecode(_$TokenTypeEnumMap, json['sub']),
      json['aud'] as String,
      json['customerId'] as int,
      json['exp'] as int,
    );

const _$TokenTypeEnumMap = {
  TokenType.access: 'accessToken',
  TokenType.refresh: 'refreshToken',
};
