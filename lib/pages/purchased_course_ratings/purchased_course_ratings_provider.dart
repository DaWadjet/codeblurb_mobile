import 'package:codeblurb_mobile/pages/home/home_provider.dart';
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
    required String review,
  }) async {
    state = AsyncData(courseId);
    try {
      ref.invalidate(
        contentBundlesQueryProvider,
      );
      await ref.read(ratingsRepositoryProvider).rateCourse(
            courseId: courseId,
            rating: rating,
            review: review.isEmpty
                ? 'Note: No review was provided by the user.'
                : review,
          );

      final _ = await ref.refresh(contentBundleQueryProvider(courseId).future);
      ref.invalidate(contentBundlesHomeQueryProvider);
      ref.read(toastNotifierProvider.notifier).showToast(
            'Course rated successfully',
          );
    } catch (e) {
      ref.read(toastNotifierProvider.notifier).showToast(
            'Failed to rate course',
          );
    } finally {
      state = const AsyncValue.data(null);
    }
  }
}
