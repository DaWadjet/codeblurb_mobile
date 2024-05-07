import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/ratings_response.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:codeblurb_mobile/widgets/course_icons.dart';
import 'package:codeblurb_mobile/widgets/course_image.dart';
import 'package:codeblurb_mobile/widgets/course_section_item.dart';
import 'package:codeblurb_mobile/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CourseDetailsCommon extends HookWidget {
  const CourseDetailsCommon({
    required this.imageUrl,
    required this.title,
    required this.numberOfPurchases,
    required this.totalHours,
    required this.courseId,
    required this.description,
    required this.isPurchased,
    required this.releaseDate,
    required this.skillLevel,
    required this.sections,
    this.ratings,
    super.key,
  });

  final String? imageUrl;
  final String title;
  final RatingsResponse? ratings;
  final int numberOfPurchases;
  final int totalHours;
  final int courseId;
  final String description;
  final bool isPurchased;
  final DateTime releaseDate;
  final SkillLevel skillLevel;
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        CourseImage(
          imageUrl: imageUrl,
          height: 200,
          width: double.infinity,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "What you'll learn",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Rating(
                      initialRating: ratings?.averageRating ?? 0,
                      itemSize: 22,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      (ratings?.averageRating ?? 0).toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  (ratings?.numberOfRatings ?? 0) > 0
                      ? 'out of ${ratings?.numberOfRatings ?? 0} ratings'
                      : 'No ratings yet',
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.mutedForeground,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$numberOfPurchases enrolled',
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.mutedForeground,
                  ),
                ),
                if ((ratings?.numberOfRatings ?? 0) > 0 || isPurchased) ...[
                  const SizedBox(
                    height: 4,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      if (isPurchased) {
                        context.router.push(
                          PurchasedCourseRatingsRoute(
                            courseId: courseId,
                          ),
                        );
                      } else {
                        context.router.push(
                          CourseRatingsRoute(
                            courseId: courseId,
                          ),
                        );
                      }
                    },
                    child: const Text('See ratings'),
                  ),
                ],
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        CourseIcons(
          totalHours: totalHours,
          skillLevel: skillLevel,
          releaseDate: releaseDate,
        ),
        const SizedBox(
          height: 36,
        ),
        const Text(
          'Course Sections',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: sections
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: CourseSectionItem(
                    section: e,
                    canNavigate: isPurchased,
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: bottomPadding + 70,
        ),
      ],
    );
  }
}
