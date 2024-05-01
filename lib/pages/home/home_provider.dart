import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
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

final contentBundlesHomeQueryProvider = contentBundlesQueryProvider(
  pageProps: SortBy.recentlyViewed(),
);

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  void build() {}

  Future<void> onRefresh() async {
    ref.invalidate(contentBundlesQueryProvider);
    await Future.wait([
      ref.refresh(shoppingCartQueryProvider.future),
      ref.refresh(topRatedQueryProvider.future),
      ref.refresh(mostPopularQueryProvider.future),
      ref.refresh(
        contentBundlesHomeQueryProvider.future,
      ),
    ]);
  }
}
