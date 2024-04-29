import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_courses_provider.g.dart';

@riverpod
class MyCoursesNotifier extends _$MyCoursesNotifier {
  @override
  void build() {}

  Future<void> onRefresh() => ref.refresh(contentBundlesQueryProvider().future);
}
