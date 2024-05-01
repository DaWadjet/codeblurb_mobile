import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:codeblurb_mobile/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CourseRatingsPage extends HookConsumerWidget {
  const CourseRatingsPage({required this.courseId, super.key});

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final courseQuery = ref.watch(shoppingItemDetailsQueryProvider(courseId));
    final bottomPadding = context.bottomPadding;
    final (distribution, percentages) = useMemoized(
      () {
        final initialRatingDistribution = {
          1: 0,
          2: 0,
          3: 0,
          4: 0,
          5: 0,
        };
        final initialPercentages = {
          1: 0.0,
          2: 0.0,
          3: 0.0,
          4: 0.0,
          5: 0.0,
        };

        return courseQuery.maybeWhen(
          data: (course) {
            for (final element in course.ratings.ratings) {
              if (initialRatingDistribution[element.rating] != null) {
                initialRatingDistribution[element.rating] =
                    initialRatingDistribution[element.rating]! + 1;
              }
            }
            final totalRatings = course.ratings.numberOfRatings;
            for (final key in initialRatingDistribution.keys) {
              initialPercentages[key] =
                  initialRatingDistribution[key]! / totalRatings;
            }
            return (initialRatingDistribution, initialPercentages);
          },
          orElse: () => (initialRatingDistribution, initialPercentages),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Course Ratings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: courseQuery.maybeWhen(
          orElse: () => const SizedBox(),
          data: (course) {
            if (course.ratings.numberOfRatings == 0) {
              //should not happen
              return const Center(
                child: Text('No ratings yet'),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Course Rating: ${course.ratings.averageRating.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        course.ratings.numberOfRatings > 0
                            ? 'out of ${course.ratings.numberOfRatings} ratings'
                            : 'No ratings yet',
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.mutedForeground,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  for (final key in distribution.keys.toList().reversed) ...[
                    Row(
                      children: [
                        Expanded(
                          child: AppProgressBar(
                            progress: percentages[key] ?? 0,
                            withText: false,
                            height: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Rating(
                          initialRating: key.toDouble(),
                          itemSize: 18,
                          itemPadding: 2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  const SizedBox(height: 12),
                  const Divider(),
                  ...course.ratings.ratings.map(
                    (e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              e.username,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              context.formatDate(e.createdAt),
                              style: TextStyle(
                                fontSize: 12,
                                color: colors.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Rating(
                          initialRating: e.rating.toDouble(),
                          itemSize: 16,
                          itemPadding: 2,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          e.comment,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                      ],
                    ),
                  ),
                  SizedBox(height: bottomPadding),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
