import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:codeblurb_mobile/core/network/models/rating_request.dart';
import 'package:codeblurb_mobile/core/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ratingsApiProvider = Provider<RatingsApi>(
  (ref) => RatingsApi(ref.watch(dioProvider)),
  name: 'Ratings API Provider',
);

class RatingsApi {
  RatingsApi(this._dio);

  final Dio _dio;

  ApiResponse postRating({
    required int courseId,
    required RatingRequest request,
  }) async {
    return _dio.post(
      '/content/ratings/$courseId',
      data: request.toJson(),
    );
  }
}
