import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:codeblurb_mobile/widgets/rating_distribution.dart';
import 'package:codeblurb_mobile/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CourseRatingsPage extends ConsumerWidget {
  const CourseRatingsPage({required this.courseId, super.key});

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseQuery = ref.watch(shoppingItemDetailsQueryProvider(courseId));
    final bottomPadding = context.bottomPadding;

    return Scaffold(
      appBar: const CBAppBar(
        title: 'Course Ratings',
      ),
      body: courseQuery.maybeWhen(
        orElse: () => const SizedBox(),
        data: (course) {
          if ((course.ratings?.numberOfRatings ?? 0) == 0) {
            //should not happen
            return const Center(
              child: Text('No ratings yet'),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                RatingDistribution(ratings: course.ratings!),
                const Divider(),
                ...course.ratings!.ratings.map(
                  (e) => RatingItem(rating: e),
                ),
                SizedBox(height: bottomPadding),
              ],
            ),
          );
        },
      ),
    );
  }
}
