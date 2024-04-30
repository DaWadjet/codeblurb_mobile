// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/course_section_item.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:codeblurb_mobile/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CourseDetailsPage extends HookConsumerWidget {
  const CourseDetailsPage({
    required this.courseId,
    super.key,
  });

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
    final fullHeight = MediaQuery.of(context).size.height;

    final courseQuery = ref.watch(shoppingItemDetailsQueryProvider(courseId));

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Course Details'),
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

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          course.contentBundle.imageUrl ?? dummyUrl,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        course.contentBundle.title,
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
                        course.contentBundle.description,
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
                                    initialRating: course.ratings.averageRating,
                                    itemSize: 22,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    course.ratings.averageRating
                                        .toStringAsFixed(1),
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
                                'out of ${course.ratings.numberOfRatings} ratings',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: colors.mutedForeground,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '${course.numberOfPurchases} enrolled',
                            style: TextStyle(
                              fontSize: 14,
                              color: colors.mutedForeground,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Assets.images.code.svg(
                                      color: colors.mutedForeground,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Java',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colors.mutedForeground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Assets.images.hourglass.svg(
                                      color: colors.mutedForeground,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '$totalHours hours',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colors.mutedForeground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Assets.images.badgeInfo.svg(
                                      color: colors.mutedForeground,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      course.contentBundle.skillLevel.value,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colors.mutedForeground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Assets.images.updatedAt.svg(
                                      color: colors.mutedForeground,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      context.formatDate(
                                        course.contentBundle.releaseDate,
                                        'yy/MM/dd',
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colors.mutedForeground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                        children: course.contentBundle.includedContent
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 16,
                                ),
                                child: CourseSectionItem(
                                  section: e,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: bottomPadding + 100,
                      ),
                    ],
                  );
                },
                error: (e, stackTrace) => const SizedBox(),
                loading: () => Padding(
                  padding: EdgeInsets.only(top: fullHeight / 3),
                  child: const Center(
                    key: ValueKey('loading'),
                    child: Loader(
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: courseQuery.maybeWhen(
              orElse: () => const SizedBox(),
              data: (data) => ColoredBox(
                key: const ValueKey('price'),
                color: colors.background,
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
                          PriceTag(
                            discount: true,
                            originalPrice: data.price,
                            isBig: true,
                          ),
                          const Spacer(),
                          HookConsumer(
                            builder: (context, ref, _) {
                              final cart = ref.watch(shoppingCartQueryProvider);
                              final cartProviderState =
                                  ref.watch(shoppingCartNotifierProvider);

                              final isItemInCart = useMemoized(
                                () {
                                  return cart.maybeWhen(
                                    data: (data) => data.shoppingItems.any(
                                      (element) => element.id == courseId,
                                    ),
                                    orElse: () => false,
                                  );
                                },
                                [cart],
                              );
                              return SizedBox(
                                height: 48,
                                width: 156,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (cartProviderState.isLoading) return;
                                    if (isItemInCart) {
                                      await context.router.push(
                                        const ShoppingCartRoute(),
                                      );
                                    } else {
                                      unawaited(
                                        ref
                                            .read(
                                              shoppingCartNotifierProvider
                                                  .notifier,
                                            )
                                            .addItemToCart(courseId),
                                      );
                                    }
                                  },
                                  child: isItemInCart
                                      ? const Text(
                                          'View Cart',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : cartProviderState.maybeWhen(
                                          data: (data) {
                                            if (data == courseId) {
                                              return const Loader(
                                                size: 32,
                                                withBackgroundColor: true,
                                              );
                                            } else {
                                              return const Text(
                                                'Add To Cart',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              );
                                            }
                                          },
                                          orElse: () => const Text(
                                            'Add To Cart',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: bottomPadding + 16,
                    ),
                  ],
                ),
              )
                  .animate()
                  .slideY(
                    curve: Curves.easeInOut,
                    begin: 1,
                    end: 0,
                  )
                  .animate()
                  .fadeIn(),
            ),
          ),
        ],
      ),
    );
  }
}
