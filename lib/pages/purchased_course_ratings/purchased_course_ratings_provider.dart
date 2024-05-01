import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchased_course_ratings_provider.g.dart';

@riverpod
class CourseRatingsNotifier extends _$CourseRatingsNotifier {
  @override
  AsyncValue<int?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> rateCourse() async {}
}
