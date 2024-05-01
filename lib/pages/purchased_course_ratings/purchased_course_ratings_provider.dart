import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchased_course_ratings_provider.g.dart';

@riverpod
class CourseRatingsNotifier extends _$CourseRatingsNotifier {
  @override
  AsyncValue<int?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> rateCourse({
    required int courseId,
    required int rating,
    required String? review,
  }) async {
    ref.read(ratingsRepositoryProvider).rateCourse(
        courseId: courseId,
        rating: rating,
        review: review ?? 'Note: No review was provided by the user.');
  }
}
