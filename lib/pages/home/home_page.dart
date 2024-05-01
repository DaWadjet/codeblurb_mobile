import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/home/home_provider.dart';
import 'package:codeblurb_mobile/pages/home/purchased_course_item.dart';
import 'package:codeblurb_mobile/pages/home/scrollable_view.dart';
import 'package:codeblurb_mobile/pages/home/shopping_course_item.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/full_page_message.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO remove list duplications

final highestRatedProps = SortBy.highestRated();
final mostPopularProps = SortBy.mostPopular();

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topRatedQuery = ref.watch(
      topRatedQueryProvider,
    );

    final mostPopularQuery = ref.watch(
      mostPopularQueryProvider,
    );

    final purchasedCoursesQuery = ref.watch(
      contentBundlesQueryProvider(pageProps: SortBy.none().copyWith(size: 3)),
    );

    final hasError = topRatedQuery.hasError ||
        mostPopularQuery.hasError ||
        purchasedCoursesQuery.hasError;

    final isLoading = topRatedQuery.isLoading && !topRatedQuery.isRefreshing ||
        mostPopularQuery.isLoading && !mostPopularQuery.isRefreshing ||
        purchasedCoursesQuery.isLoading && !purchasedCoursesQuery.isRefreshing;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AdaptivePullToRefresh(
              onRefresh: ref.watch(homeNotifierProvider.notifier).onRefresh,
              child: isLoading
                  ? const FullPageLoader()
                  : hasError
                      ? const FullPageError(
                          null,
                          null,
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 10),
                            purchasedCoursesQuery.maybeWhen(
                              orElse: SizedBox.new,
                              data: (data) => ScrollableView(
                                items: data.content,
                                title: 'Continue Learning',
                                ctor: PurchasedCourseItem.new,
                              ),
                            ),
                            const SizedBox(height: 36),
                            mostPopularQuery.maybeWhen(
                              orElse: SizedBox.new,
                              data: (data) => ScrollableView(
                                items: data.content,
                                title: 'Most Popular Courses',
                                ctor: ShoppingCourseItem.new,
                              ),
                            ),
                            const SizedBox(height: 36),
                            topRatedQuery.maybeWhen(
                              orElse: SizedBox.new,
                              data: (data) => ScrollableView(
                                items: data.content,
                                title: 'Top Rated Courses',
                                ctor: ShoppingCourseItem.new,
                              ),
                            ),
                            const SizedBox(height: 36),
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
