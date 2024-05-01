import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/purchased_course_ratings/purchased_course_ratings_provider.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RatingBottomSheet extends HookConsumerWidget {
  const RatingBottomSheet({required this.courseId, super.key});

  final int courseId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final rating = useState(0.toDouble());
    final ratingMutationState = ref.watch(courseRatingsNotifierProvider);
    final bottomPadding = context.bottomPadding;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                'Rate this course',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Rating(
                itemSize: 28,
                itemPadding: 3,
                initialRating: rating.value,
                onRatingUpdate: (value) => rating.value = value,
              ),
              const SizedBox(
                height: 16,
              ),
              InputField(
                controller: controller,
                maxLines: 4,
                hint: 'Write a review',
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: rating.value == 0
                      ? null
                      : () async {
                          await ref
                              .read(courseRatingsNotifierProvider.notifier)
                              .rateCourse(
                                courseId: courseId,
                                rating: rating.value.toInt(),
                                review: controller.text,
                              );
                          if (context.mounted) {
                            unawaited(context.router.maybePop());
                          }
                        },
                  child: ratingMutationState.whenOrNull(
                    data: (data) {
                      if (data == courseId) {
                        return const Loader(
                          size: 32,
                          withBackgroundColor: true,
                        );
                      } else {
                        return const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: bottomInset + bottomPadding,
        ),
      ],
    );
  }
}
