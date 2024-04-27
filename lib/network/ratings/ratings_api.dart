import 'package:codeblurb_mobile/network/models/rating_request.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';

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
