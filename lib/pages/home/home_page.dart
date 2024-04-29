import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/home/home_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final highestRatedProps = SortBy.highestRated();
final mostPopularProps = SortBy.mostPopular();

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullHeight = MediaQuery.of(context).size.height;
    final colors = useColors();

    final topRatedQuery = ref.watch(
      topRatedQueryProvider,
    );

    final mostPopularQuery = ref.watch(
      mostPopularQueryProvider,
    );

    final purchasedCoursesQuery = ref.watch(
      contentBundlesQueryProvider(),
    );

    final hasError = topRatedQuery.hasError ||
        mostPopularQuery.hasError ||
        purchasedCoursesQuery.hasError;

    final isLoading = topRatedQuery.isLoading ||
        mostPopularQuery.isLoading ||
        purchasedCoursesQuery.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          AdaptivePullToRefresh(
            onRefresh: ref.watch(homeNotifierProvider.notifier).onRefresh,
            child: isLoading
                ? Padding(
                    padding: EdgeInsets.only(top: fullHeight / 3),
                    child: const Center(
                      key: ValueKey('loading'),
                      child: Loader(
                        size: 48,
                      ),
                    ),
                  )
                : hasError
                    ? Padding(
                        padding: EdgeInsets.only(top: fullHeight / 3),
                        child: const Center(
                          key: ValueKey('error'),
                          child:
                              Text('An error occurred\nPlease try again later'),
                        ),
                      )
                    : Column(
                        children: [
                          purchasedCoursesQuery.maybeWhen(
                            orElse: () => const SizedBox(),
                            data: (data) {
                              if (data.content.isEmpty) {
                                return const SizedBox();
                              } else {
                                return const Text('Purchased Courses');
                              }
                            },
                          ),
                          mostPopularQuery.maybeWhen(
                            orElse: () => const SizedBox(),
                            data: (data) {
                              if (data.content.isEmpty) {
                                return const SizedBox();
                              } else {
                                return const Text('Most Popular Courses');
                              }
                            },
                          ),
                          topRatedQuery.maybeWhen(
                            orElse: () => const SizedBox(),
                            data: (data) {
                              if (data.content.isEmpty) {
                                return const SizedBox();
                              } else {
                                return const Text('Top rated Courses');
                              }
                            },
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
