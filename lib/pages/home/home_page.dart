import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/home/home_provider.dart';
import 'package:codeblurb_mobile/pages/home/purchased_course_item.dart';
import 'package:codeblurb_mobile/pages/home/shopping_course_item.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
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
    final fullHeight = MediaQuery.of(context).size.height;

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
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: fullHeight / 3 + kToolbarHeight),
                      child: const Center(
                        key: ValueKey('loading'),
                        child: Loader(
                          size: 48,
                        ),
                      ),
                    )
                  : hasError
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: fullHeight / 3 + kToolbarHeight),
                          child: const Center(
                            key: ValueKey('error'),
                            child: Text(
                              'An error occurred\nPlease try again later',
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 10),
                            purchasedCoursesQuery.maybeWhen(
                              orElse: () => const SizedBox(),
                              data: (data) {
                                if (data.content.isEmpty) {
                                  return const SizedBox();
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(
                                          'Continue Learning',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 244,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            ...[
                                              ...data.content,
                                              ...data.content,
                                            ].map(
                                              PurchasedCourseItem.new,
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 36),
                            mostPopularQuery.maybeWhen(
                              orElse: () => const SizedBox(),
                              data: (data) {
                                if (data.content.isEmpty) {
                                  return const SizedBox();
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(
                                          'Most Popular Courses',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 244,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            ...[
                                              ...data.content,
                                              ...data.content,
                                            ].map(
                                              ShoppingCourseItem.new,
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 36),
                            topRatedQuery.maybeWhen(
                              orElse: () => const SizedBox(),
                              data: (data) {
                                if (data.content.isEmpty) {
                                  return const SizedBox();
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Text(
                                          'Top Rated Courses',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height: 244,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            ...[
                                              ...data.content,
                                              ...data.content,
                                            ].map(
                                              ShoppingCourseItem.new,
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
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
