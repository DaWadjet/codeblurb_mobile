// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      $enumDecode(_$PaymentStatusTypeEnumMap, json['status']),
      (json['boughtContentBundles'] as List<dynamic>)
          .map((e) =>
              MinimalContentBundleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$PaymentStatusTypeEnumMap = {
  PaymentStatusType.paid: 'PAID',
  PaymentStatusType.pending: 'PENDING',
  PaymentStatusType.failed: 'FAILED',
};
