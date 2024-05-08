import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/answer_slot.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/drag_and_drop_provider.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/draggable_item.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DragAndDropTaskTab extends HookConsumerWidget {
  const DragAndDropTaskTab({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final CodingContentResponse viewedContent;
  final int courseId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dragAndDropNotifierProvider);

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
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                runSpacing: 12,
                children: [
                  for (int i = 0;
                      i < viewedContent.codeSkeleton.length;
                      i++) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        viewedContent.codeSkeleton[i],
                        style: const TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    if (i < viewedContent.codeSkeleton.length - 1)
                      AnswerSlot(answer: state.editedSolutions[i], index: i),
                  ],
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              DragTarget<DragProps>(
                builder: (
                  BuildContext context,
                  List<DragProps?> incoming,
                  List<dynamic> rejected,
                ) {
                  return Card(
                    margin: EdgeInsets.zero,
                    color: incoming.isEmpty ? colors.background : colors.accent,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Unused answers:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                            width: double.infinity,
                          ),
                          if (state.remainingChoices.isEmpty)
                            Text(
                              'No more answers left!',
                              style: TextStyle(
                                fontSize: 16,
                                color: colors.mutedForeground,
                              ),
                            )
                          else
                            Wrap(
                              runSpacing: 12,
                              spacing: 12,
                              children: [
                                ...state.remainingChoices.map(
                                  (c) => DraggableItem(
                                    answer: c,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
                onWillAcceptWithDetails: (data) => data.data.fromIndex != -1,
                onAcceptWithDetails: (data) {
                  ref
                      .read(dragAndDropNotifierProvider.notifier)
                      .returnAnswerToChoices(data.data);
                },
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
                                    dragAndDropNotifierProvider.notifier,
                                  )
                                  .showHint();
                            },
                            child: const Text('Show hint'),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => ref
                            .read(dragAndDropNotifierProvider.notifier)
                            .resetState(
                              withoutPageReset: true,
                            ),
                        child: const Text(
                          'Reset task',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      NextSectionButton(
                        isTextButton:
                            state.solution?.correctAnswerIndices.length !=
                                state.editedSolutions.length,
                        courseId: courseId,
                        viewedContentId: viewedContent.id,
                      ),
                    ],
                  ),
                  SizedBox(height: 60 + bottomPadding),
                ],
              ),
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
                        .read(dragAndDropNotifierProvider.notifier)
                        .submitDragAndDropSolution(
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
