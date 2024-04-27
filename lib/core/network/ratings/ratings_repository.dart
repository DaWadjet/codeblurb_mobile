import 'package:codeblurb_mobile/core/network/models/rating_request.dart';
import 'package:codeblurb_mobile/core/network/ratings/ratings_api.dart';

class RatingsRepository {
  RatingsRepository(this._ratingsApi);
  final RatingsApi _ratingsApi;

  Future<void> rateCourse({
    required int courseId,
    required int rating,
    required String review,
  }) async {
    await _ratingsApi.postRating(
      courseId: courseId,
      request: RatingRequest(rating, review),
    );
  }
}
