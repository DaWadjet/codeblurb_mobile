import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchasedCourseItem extends HookConsumerWidget {
  const PurchasedCourseItem(this.content, {super.key});

  final MinimalContentBundleResponse content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(isLoggedInProvider.notifier).getUsername();

    final ratingOfUser = useMemoized(
      () {
        try {
          return content.ratings.ratings
              .firstWhere((r) => r.username == username)
              .rating;
        } catch (e) {
          return 0;
        }
      },
      [content.ratings.ratings, username],
    );
    final colors = useColors();

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Tappable(
        borderRadius: 12,
        onTap: () => context.router.push(
          PurchasedCourseDetailsRoute(
            courseId: content.id,
          ),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors.border,
              ),
            ),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: content.imageUrl ?? dummyUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 122,
                ),
                const SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          content.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        BriefInfo(
                          skillLevel: content.skillLevel,
                        ),
                        const SizedBox(height: 6),
                        Stack(
                          children: [
                            AppProgressBar(
                              progress: content.progress ?? 0,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: ratingOfUser > 0
                                  ? Row(
                                      children: [
                                        Text(
                                          'You rated:',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: colors.mutedForeground,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          ratingOfUser.toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        Assets.images.starFilled.svg(
                                          // ignore: deprecated_member_use_from_same_package
                                          color: Colors.amber,
                                          width: 12,
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'Leave a review!',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colors.mutedForeground,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
