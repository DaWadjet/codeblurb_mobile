import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_courses_provider.g.dart';

@riverpod
class MyCoursesNotifier extends _$MyCoursesNotifier {
  @override
  void build() {}

  Future<void> onRefresh([PageProps? props]) {
    ref.invalidate(contentBundlesQueryProvider);

    return ref.refresh(contentBundlesQueryProvider(pageProps: props).future);
  }
}
