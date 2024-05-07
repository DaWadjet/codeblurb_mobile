import 'dart:math';

import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/pages/content/fill_the_gaps_content/fill_the_gaps_provider.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FillTheGapsTaskTab extends HookConsumerWidget {
  const FillTheGapsTaskTab({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final CodingContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fillTheGapsNotifierProvider);

    final bottomPadding = context.bottomPadding;
    final colors = useColors();

    if (state.editedSolutions.isEmpty) {
      return const SizedBox();
    }

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              FocusTraversalGroup(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runSpacing: 12,
                  children: [
                    for (int i = 0;
                        i < viewedContent.codeSkeleton.length;
                        i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          viewedContent.codeSkeleton[i],
                          style: const TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                      if (i < viewedContent.codeSkeleton.length - 1)
                        SizedBox(
                          width: 80 +
                              max(0, state.editedSolutions[i].length - 5) * 12,
                          child: InputField(
                            textInputAction:
                                i == viewedContent.codeSkeleton.length - 2
                                    ? TextInputAction.done
                                    : TextInputAction.next,
                            onSubmit: () {
                              if (i == viewedContent.codeSkeleton.length - 2) {
                                ref
                                    .read(fillTheGapsNotifierProvider.notifier)
                                    .submitFillTheGapsSolution(
                                      contentId: viewedContent.id,
                                      courseId: courseId,
                                    );
                              }
                            },
                            borderColor: state.solution?.incorrectSolutions.any(
                                      (s) => s.incorrectSolutionIndex == i,
                                    ) ??
                                    false
                                ? colors.destructive
                                : state.solution?.correctAnswerIndices
                                            .contains(i) ??
                                        false
                                    ? Colors.green[600]
                                    : null,
                            height: 36,
                            style: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              fontFamily: 'monospace',
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.url,
                            onChanged: (value) {
                              ref
                                  .read(fillTheGapsNotifierProvider.notifier)
                                  .changeEditedSolution(
                                    i,
                                    value ?? '',
                                  );
                            },
                            hint: '...',
                          ),
                        ),
                    ],
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  if (state.shownHints < viewedContent.hints.length)
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Text(
                            'Need some help?',
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.mutedForeground,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(
                                    fillTheGapsNotifierProvider.notifier,
                                  )
                                  .showHint();
                            },
                            child: const Text('Show hint'),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 32),
                  NextSectionButton(
                    isTextButton: state.solution?.correctAnswerIndices.length !=
                        state.editedSolutions.length,
                    courseId: courseId,
                    viewedContentId: viewedContent.id,
                  ),
                ],
              ),
              SizedBox(height: 60 + bottomPadding),
            ],
          ),
        ),
        BottomCallToAction(
          child: Column(
            children: [
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: state.isLoading
                        ? const Loader(
                            size: 32,
                            withBackgroundColor: true,
                          )
                        : const Text(
                            'Check solution!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                    onPressed: () => ref
                        .read(fillTheGapsNotifierProvider.notifier)
                        .submitFillTheGapsSolution(
                          contentId: viewedContent.id,
                          courseId: courseId,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: bottomPadding + 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
