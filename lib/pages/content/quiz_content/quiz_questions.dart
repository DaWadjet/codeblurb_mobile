import 'dart:math';

import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_provider.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizQuestions extends HookConsumerWidget {
  const QuizQuestions(this.viewedContent, {super.key});

  final QuizContentResponse viewedContent;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final answers =
        ref.watch(quizContentNotifierProvider.select((value) => value.answers));

    final shownQuestionIndex = ref.watch(
      quizContentNotifierProvider.select((value) => value.shownQuestionIndex),
    );

    final progress = useMemoized(
      () =>
          max(shownQuestionIndex, 0).toDouble() /
          viewedContent.questions.length.toDouble(),
      [shownQuestionIndex, viewedContent.questions.length],
    );

    if (shownQuestionIndex >= viewedContent.questions.length ||
        shownQuestionIndex < 0) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 71,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: AppProgressBar(
                        progress: progress,
                        height: 10,
                        withText: false,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${shownQuestionIndex + 1}/${viewedContent.questions.length}',
                    style: TextStyle(
                      fontSize: 16,
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: ref
                        .read(quizContentNotifierProvider.notifier)
                        .showPreviousQuestion,
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.zero,
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  if (shownQuestionIndex < answers.length)
                    TextButton(
                      onPressed: ref
                          .read(quizContentNotifierProvider.notifier)
                          .showNextQuestion,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 8),
            Column(
              children: [
                Text(
                  viewedContent.questions[shownQuestionIndex].question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                ...viewedContent.questions[shownQuestionIndex].answers.map(
                  (e) {
                    final question =
                        viewedContent.questions[shownQuestionIndex];
                    final isSelected = answers.any(
                      (element) =>
                          element.$1 == question.id &&
                          element.$2 == question.answers.indexOf(e),
                    );
                    return Column(
                      children: [
                        const Divider(),
                        Tappable(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colors.accent.withOpacity(0.7)
                                  : colors.background,
                            ),
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onTap: () => ref
                              .read(quizContentNotifierProvider.notifier)
                              .answerQuestion(
                                question.id,
                                question.answers.indexOf(e),
                              ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
