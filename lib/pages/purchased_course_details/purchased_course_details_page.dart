// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:codeblurb_mobile/pages/purchased_course_details/next_up_section.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:codeblurb_mobile/widgets/course_details_common.dart';
import 'package:codeblurb_mobile/widgets/full_page_message.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PurchasedCourseDetailsPage extends HookConsumerWidget {
  const PurchasedCourseDetailsPage({
    required this.courseId,
    super.key,
  });

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseQuery = ref.watch(contentBundleQueryProvider(courseId));

    return Scaffold(
      appBar: const CBAppBar(
        title: 'Course Details',
      ),
      body: Stack(
        children: [
          AdaptivePullToRefresh(
            onRefresh: () =>
                ref.read(contentBundleQueryProvider(courseId).future),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: courseQuery.when(
                data: (course) {
                  final sections = course.sections;

                  final totalHours = (sections.fold(
                        0,
                        (previousValue, element) =>
                            previousValue + element.estimatedTime,
                      )) ~/
                      60;

                  return CourseDetailsCommon(
                    imageUrl: course.imageUrl,
                    title: course.title,
                    ratings: course.ratings,
                    numberOfPurchases: course.numberOfPurchases,
                    totalHours: totalHours,
                    courseId: courseId,
                    description: course.description,
                    isPurchased: true,
                    releaseDate: course.releaseDate,
                    skillLevel: course.skillLevel,
                    sections: sections,
                  );
                },
                error: (e, stackTrace) => const SizedBox(),
                loading: FullPageLoader.new,
              ),
            ),
          ),
          BottomCallToAction(
            child: courseQuery.maybeWhen(
              orElse: SizedBox.new,
              data: (course) {
                late final Section? nextUp;
                try {
                  nextUp = course.sections.firstWhere(
                    (element) => element.status == SeenStatus.notSeen,
                  );
                } catch (e) {
                  nextUp = null;
                }
                if (nextUp == null) {
                  return const SizedBox();
                }
                return NextUpSection(nextUp: nextUp);
              },
            ),
          ),
        ],
      ),
    );
  }
}
