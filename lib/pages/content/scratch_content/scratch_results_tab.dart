// ignore_for_file: deprecated_member_use_from_same_package

import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/network/models/outcome.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_test_case.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScratchResultsTab extends HookConsumerWidget {
  const ScratchResultsTab({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final CodingContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxHeight = MediaQuery.of(context).size.height;
    final state = ref.watch(scratchNotifierProvider);
    final bottomPadding = context.bottomPadding;
    final colors = useColors();

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: maxHeight / 3,
                child: SyntaxView(
                  code: state.code,
                  syntax: Syntax.JAVA,
                  syntaxTheme: SyntaxTheme.vscodeDark(),
                  fontSize: 14,
                  withZoom: false,
                  expanded: true,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    if (state.solution?.compilationErrors?.isNotEmpty ?? false)
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: ShapeBorder.lerp(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: colors.destructive,
                              ),
                            ),
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: colors.destructive,
                              ),
                            ),
                            1,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Assets.images.circleX.svg(
                                      width: 20,
                                      height: 20,
                                      color: colors.destructive,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Compilation error',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  state.solution?.compilationErrors ?? '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    for (int index = 0;
                        index < (viewedContent.testCases?.length ?? 0);
                        index++)
                      ScratchTestCase(
                        testCase: viewedContent.testCases![index],
                        index: index,
                      ),
                    if (state.shownHints < viewedContent.hints.length) ...[
                      const SizedBox(height: 24),
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
                                      scratchNotifierProvider.notifier,
                                    )
                                    .showHint();
                              },
                              child: const Text('Show hint'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 32),
              NextSectionButton(
                isTextButton: state.solution?.outcome != Outcome.passed,
                courseId: courseId,
                viewedContentId: viewedContent.id,
              ),
              SizedBox(height: 80 + bottomPadding),
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
                    onPressed: () => ref
                        .read(scratchNotifierProvider.notifier)
                        .submitScratchSolution(
                          contentId: viewedContent.id,
                          courseId: courseId,
                        ),
                    child: state.isLoading
                        ? const Loader(
                            size: 32,
                            withBackgroundColor: true,
                          )
                        : const Text(
                            'Run Code!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
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
