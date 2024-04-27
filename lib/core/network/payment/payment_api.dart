import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:codeblurb_mobile/core/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentApiProvider = Provider<PaymentApi>(
  (ref) => PaymentApi(ref.watch(dioProvider)),
  name: 'Payment API Provider',
);

class PaymentApi {
  PaymentApi(this._dio);

  final Dio _dio;

  ApiResponse getPayments() async {
    return _dio.get('/payments');
  }
}
