import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/custom_will_pop.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_bottom_actions.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_initial_content.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_provider.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_questions.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_review_unsubmitted_content.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class QuizContentPage extends HookConsumerWidget {
  const QuizContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final QuizContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomPadding = context.bottomPadding;
    final shownQuestionIndex = ref.watch(
      quizContentNotifierProvider.select((value) => value.shownQuestionIndex),
    );
    final hasSolution = ref.watch(
      quizContentNotifierProvider.select((value) => value.solution != null),
    );

    return CustomWillPop(
      skipCheck: hasSolution,
      onPop: ref.read(quizContentNotifierProvider.notifier).resetState,
      child: Scaffold(
        appBar: CBAppBar(
          title: 'Quiz - ${viewedContent.name}',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: 150.ms,
                  child: shownQuestionIndex < 0
                      ? QuizInitialContent(
                          viewedContent,
                          key: const ValueKey('intro'),
                        )
                      : shownQuestionIndex >= viewedContent.questions.length
                          ? QuizReviewUnsubmittedContent(
                              viewedContent,
                              courseId,
                              key: const ValueKey('review'),
                            )
                          : QuizQuestions(
                              viewedContent,
                              key: const ValueKey('questions'),
                            ),
                ),
              ),
              QuizBottomActions(viewedContent, courseId),
              SizedBox(height: bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}
