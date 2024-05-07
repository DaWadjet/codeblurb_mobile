import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizBottomActions extends ConsumerWidget {
  const QuizBottomActions(this.viewedContent, this.courseId, {super.key});

  final QuizContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shownQuestionIndex = ref.watch(
      quizContentNotifierProvider.select((value) => value.shownQuestionIndex),
    );
    final isNextSectionHighlighted = ref.watch(
      quizContentNotifierProvider.select(
        (value) => value.solution?.incorrectSolutions.isEmpty ?? false,
      ),
    );
    final hasSubmitted = ref.watch(
      quizContentNotifierProvider.select((value) => value.solution != null),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (shownQuestionIndex < 0) ...[
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: ref
                    .read(quizContentNotifierProvider.notifier)
                    .showNextQuestion,
                child: const Text("I'm ready!"),
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (shownQuestionIndex >= viewedContent.questions.length &&
              !hasSubmitted) ...[
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  final shouldPush = await ref
                      .read(quizContentNotifierProvider.notifier)
                      .submitQuizSolution(
                        courseId: courseId,
                        contentId: viewedContent.id,
                      );
                  if (context.mounted && shouldPush) {
                    unawaited(
                      context.router.push(
                        QuizContentResultsRoute(
                          viewedContent: viewedContent,
                          courseId: courseId,
                        ),
                      ),
                    );
                  }
                },
                child: Consumer(
                  builder: (context, ref, child) {
                    final isLoading = ref.watch(
                      quizContentNotifierProvider
                          .select((value) => value.isLoading),
                    );

                    return isLoading
                        ? const Loader(
                            withBackgroundColor: true,
                            size: 32,
                          )
                        : const Text(
                            'Submit Answers',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          Row(
            mainAxisAlignment: shownQuestionIndex >= 0
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (shownQuestionIndex >= 0)
                TextButton(
                  onPressed: () {
                    if (hasSubmitted) {
                      context.router.maybePop();
                    }
                    ref.read(quizContentNotifierProvider.notifier).resetState();
                  },
                  child: const Text(
                    'Restart quiz',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              NextSectionButton(
                courseId: courseId,
                viewedContentId: viewedContent.id,
                isTextButton: !isNextSectionHighlighted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
