import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

final topRatedQueryProvider = availableShoppingItemsQueryProvider(
  pageProps: SortBy.highestRated(),
);

final mostPopularQueryProvider = availableShoppingItemsQueryProvider(
  pageProps: SortBy.mostPopular(),
);

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  void build() {}

  Future<void> onRefresh() async {
    await Future.wait([
      ref.refresh(topRatedQueryProvider.future),
      ref.refresh(mostPopularQueryProvider.future),
      ref.refresh(contentBundlesQueryProvider().future),
    ]);
  }
}
