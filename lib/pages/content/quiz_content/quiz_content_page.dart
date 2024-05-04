import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final colors = useColors();
    final answers = useState<List<(int, int)>>([]);
    final shownQuestionIndex = useState(-1);

    final progress = useMemoized(
      () =>
          max(shownQuestionIndex.value, 0).toDouble() /
          viewedContent.questions.length.toDouble(),
      [shownQuestionIndex.value, viewedContent.questions.length],
    );

    return Scaffold(
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
                child: shownQuestionIndex.value < 0
                    ? Column(
                        key: const ValueKey('intro'),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 71,
                            child: Text(
                              'Let the quiz begin!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                viewedContent.shortDescription,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Answer the following questions to test your knowledge of the topic.',
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.mutedForeground,
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      )
                    : shownQuestionIndex.value >= viewedContent.questions.length
                        ? Column(
                            key: const ValueKey('review'),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 71,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Review your answers',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        shownQuestionIndex.value--;
                                      },
                                      style: const ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                          EdgeInsets.zero,
                                        ),
                                      ),
                                      child: const Text(
                                        'Change',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ...viewedContent.questions.map(
                                        (q) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 16,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent,
                                              ),
                                              child: Card(
                                                margin: EdgeInsets.zero,
                                                child: ExpansionTile(
                                                  childrenPadding:
                                                      const EdgeInsets.only(
                                                    left: 16,
                                                    right: 24,
                                                    bottom: 12,
                                                  ),
                                                  title: Text(
                                                    q.question,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Your answer is',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: colors
                                                                  .mutedForeground,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            answers.value
                                                                        .firstWhere(
                                                                          (a) =>
                                                                              a.$1 ==
                                                                              q.id,
                                                                          orElse:
                                                                              () => (
                                                                            -1,
                                                                            -1
                                                                          ),
                                                                        )
                                                                        .$2 >=
                                                                    0
                                                                ? q.answers[answers
                                                                    .value
                                                                    .firstWhere(
                                                                      (a) =>
                                                                          a.$1 ==
                                                                          q.id,
                                                                    )
                                                                    .$2]
                                                                : 'No answer',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            key: const ValueKey('question'),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 71,
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: AppProgressBar(
                                              progress: progress,
                                              height: 10,
                                              withText: false,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          '${shownQuestionIndex.value + 1}/${viewedContent.questions.length}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: colors.mutedForeground,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            shownQuestionIndex.value--;
                                          },
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
                                        if (shownQuestionIndex.value <
                                            answers.value.length)
                                          TextButton(
                                            onPressed: () {
                                              shownQuestionIndex.value++;
                                            },
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
                                        viewedContent
                                            .questions[shownQuestionIndex.value]
                                            .question,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      ...viewedContent
                                          .questions[shownQuestionIndex.value]
                                          .answers
                                          .map(
                                        (e) {
                                          final question =
                                              viewedContent.questions[
                                                  shownQuestionIndex.value];
                                          final isSelected = answers.value.any(
                                            (element) =>
                                                element.$1 == question.id &&
                                                element.$2 ==
                                                    question.answers.indexOf(e),
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
                                                        ? colors.accent
                                                            .withOpacity(0.7)
                                                        : colors.background,
                                                  ),
                                                  child: Text(
                                                    e,
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  final values = answers.value;

                                                  final indexOfAnswer =
                                                      values.indexWhere(
                                                    (element) =>
                                                        element.$1 ==
                                                        question.id,
                                                  );
                                                  if (indexOfAnswer >= 0) {
                                                    answers.value = [
                                                      ...values.map(
                                                        (v) => v.$1 ==
                                                                question.id
                                                            ? (
                                                                question.id,
                                                                question.answers
                                                                    .indexOf(e)
                                                              )
                                                            : v,
                                                      ),
                                                    ];
                                                  } else {
                                                    answers.value = [
                                                      ...values,
                                                      (
                                                        question.id,
                                                        question.answers
                                                            .indexOf(e)
                                                      ),
                                                    ];
                                                  }
                                                  shownQuestionIndex.value++;
                                                },
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
                          ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (shownQuestionIndex.value < 0) ...[
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          shownQuestionIndex.value = 0;
                        },
                        child: const Text("I'm ready!"),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (shownQuestionIndex.value >=
                      viewedContent.questions.length) ...[
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          //TODO
                        },
                        child: const Text('Submit Answers'),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  Row(
                    mainAxisAlignment: shownQuestionIndex.value >= 0
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      if (shownQuestionIndex.value >= 0)
                        TextButton(
                          onPressed: () {
                            answers.value = [];
                            shownQuestionIndex.value = -1;
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
                        isTextButton: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: bottomPadding),
          ],
        ),
      ),
    );
  }
}
