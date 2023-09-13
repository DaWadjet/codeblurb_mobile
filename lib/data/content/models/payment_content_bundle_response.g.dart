// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_content_bundle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentContentBundleResponse _$PaymentContentBundleResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentContentBundleResponse(
      (json['includedContent'] as List<dynamic>)
          .map((e) => PaymentContentBundleItemResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
