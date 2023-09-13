// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_payments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousPaymentsResponse _$PreviousPaymentsResponseFromJson(
        Map<String, dynamic> json) =>
    PreviousPaymentsResponse(
      (json['previousPayments'] as List<dynamic>)
          .map((e) => PaymentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
