// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_content_bundle_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentContentBundleItemResponse _$PaymentContentBundleItemResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentContentBundleItemResponse(
      json['name'] as String,
      $enumDecode(_$ContentTypeEnumMap, json['contentType']),
    );

const _$ContentTypeEnumMap = {
  ContentType.coding: 'CODING',
  ContentType.video: 'VIDEO',
  ContentType.quiz: 'QUIZ',
};
