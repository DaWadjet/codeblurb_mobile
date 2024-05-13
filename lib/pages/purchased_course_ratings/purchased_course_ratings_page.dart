import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/purchased_course_ratings/rating_bottom_sheet.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:codeblurb_mobile/widgets/full_page_message.dart';
import 'package:codeblurb_mobile/widgets/rating_distribution.dart';
import 'package:codeblurb_mobile/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PurchasedCourseRatingsPage extends HookConsumerWidget {
  const PurchasedCourseRatingsPage({required this.courseId, super.key});

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseQuery = ref.watch(contentBundleQueryProvider(courseId));
    final bottomPadding = context.bottomPadding;
    final username = ref.watch(isLoggedInProvider.notifier).getUsername();

    return Scaffold(
      appBar: const CBAppBar(
        title: 'Course Ratings',
      ),
      body: courseQuery.maybeWhen(
        orElse: () => const SizedBox(),
        data: (course) {
          final ratingOfUser = course.ratings?.ratings
              .where((r) => r.username == username)
              .firstOrNull;

          return Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    if ((course.ratings?.numberOfRatings ?? 0) == 0)
                      const FullPageMessage(
                        message: 'No ratings yet',
                      )
                    else ...[
                      RatingDistribution(ratings: course.ratings!),
                      const Divider(),
                      ...course.ratings!.ratings.map(
                        (e) => RatingItem(rating: e),
                      ),
                      SizedBox(height: bottomPadding + 70),
                    ],
                  ],
                ),
              ),
              if (ratingOfUser == null)
                BottomCallToAction(
                  child: Column(
                    children: [
                      const Divider(),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Text(
                              'Rate this course',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () => context.showBottomSheet<void>(
                                  content: RatingBottomSheet(
                                    courseId: courseId,
                                  ),
                                ),
                                child: const Text(
                                  'Rate',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: bottomPadding,
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
