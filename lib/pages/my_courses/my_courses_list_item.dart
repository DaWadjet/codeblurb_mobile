import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:codeblurb_mobile/widgets/course_image.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';

class MyCoursesListItem extends StatelessWidget {
  const MyCoursesListItem({required this.content, super.key});

  final MinimalContentBundleResponse content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Tappable(
        onTap: () => context.router.push(
          PurchasedCourseDetailsRoute(
            courseId: content.id,
          ),
        ),
        child: SizedBox(
          height: 122,
          child: Row(
            children: [
              CourseImage(
                imageUrl: content.imageUrl,
                height: 122,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        content.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      BriefInfo(
                        skillLevel: content.skillLevel,
                      ),
                      const SizedBox(height: 8),
                      AppProgressBar(
                        progress: content.progress ?? 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
