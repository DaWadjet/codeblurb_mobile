// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/course_details/purchase_incentive_section.dart';
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
class CourseDetailsPage extends ConsumerWidget {
  const CourseDetailsPage({
    required this.courseId,
    super.key,
  });

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseQuery = ref.watch(shoppingItemDetailsQueryProvider(courseId));

    return Scaffold(
      appBar: const CBAppBar(
        title: 'Course Details',
      ),
      body: Stack(
        children: [
          AdaptivePullToRefresh(
            onRefresh: () =>
                ref.read(shoppingItemDetailsQueryProvider(courseId).future),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: courseQuery.when(
                data: (course) {
                  final totalHours = (course.contentBundle.includedContent.fold(
                        0,
                        (previousValue, element) =>
                            previousValue + element.estimatedTime,
                      )) ~/
                      60;

                  return CourseDetailsCommon(
                    imageUrl: course.contentBundle.imageUrl,
                    title: course.contentBundle.title,
                    ratings: course.ratings,
                    numberOfPurchases: course.numberOfPurchases,
                    totalHours: totalHours,
                    courseId: courseId,
                    description: course.contentBundle.description,
                    isPurchased: false,
                    releaseDate: course.contentBundle.releaseDate,
                    skillLevel: course.contentBundle.skillLevel,
                    sections: course.contentBundle.includedContent
                        .map(
                          (e) => Section(
                            name: e.name,
                            shortDescription: e.shortDescription,
                            estimatedTime: e.estimatedTime,
                            contentType: e.contentType,
                            status: e.status,
                            content: e,
                            courseId: courseId,
                          ),
                        )
                        .toList(),
                  );
                },
                error: FullPageError.new,
                loading: FullPageLoader.new,
              ),
            ),
          ),
          BottomCallToAction(
            child: courseQuery.maybeWhen(
              orElse: SizedBox.new,
              data: (data) => PurchaseIncentiveSection(
                courseId: courseId,
                price: data.price,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
