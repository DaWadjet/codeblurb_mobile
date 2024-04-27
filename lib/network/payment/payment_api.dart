import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';

class PaymentApi {
  PaymentApi(this._dio);

  final Dio _dio;

  ApiResponse getPayments() async {
    return _dio.get('/payments');
  }
}
