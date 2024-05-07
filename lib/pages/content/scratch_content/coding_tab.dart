import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/character_insertion_row.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CodingTab extends HookConsumerWidget {
  const CodingTab({
    required this.node,
    required this.textEditingController,
    required this.contentId,
    required this.courseId,
    super.key,
  });

  final FocusNode node;
  final TextEditingController textEditingController;
  final int contentId;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomPadding = context.bottomPadding;
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            focusNode: node,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            enableSuggestions: false,
                            decoration: null,
                            autocorrect: false,
                            controller: textEditingController,
                          ),
                        ),
                      ),
                      if (!node.hasFocus)
                        ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: SizedBox(
                              height: 44,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => ref
                                    .read(scratchNotifierProvider.notifier)
                                    .submitScratchSolution(
                                      contentId: contentId,
                                      courseId: courseId,
                                    ),
                                child: const Text(
                                  'Run Code!',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10 + bottomPadding),
                        ].animate(delay: 200.ms).fadeIn(),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: node.hasFocus
                            ? CharacterInsertionRow(
                                key: const ValueKey('keyboard'),
                                controller: textEditingController,
                                onUnfocus: node.unfocus,
                                onPlayPressed: () {
                                  ref
                                      .read(scratchNotifierProvider.notifier)
                                      .submitScratchSolution(
                                        contentId: contentId,
                                        courseId: courseId,
                                      );
                                },
                              )
                            : const SizedBox(
                                key: ValueKey('empty'),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
