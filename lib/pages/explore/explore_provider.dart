import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explore_provider.g.dart';

@riverpod
class ExploreNotifier extends _$ExploreNotifier {
  @override
  void build() {}

  Future<void> onRefresh([PageProps? props]) {
    ref.invalidate(availableShoppingItemsQueryProvider);

    return ref
        .refresh(availableShoppingItemsQueryProvider(pageProps: props).future);
  }
}
