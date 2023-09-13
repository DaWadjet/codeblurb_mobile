// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      (json['pricePayed'] as num).toDouble(),
      (json['boughtContentBundles'] as List<dynamic>)
          .map((e) =>
              PaymentContentBundleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
