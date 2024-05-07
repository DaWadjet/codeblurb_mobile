// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_bottom_actions.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_provider.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class QuizContentResultsPage extends HookConsumerWidget {
  const QuizContentResultsPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final QuizContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
    final solution = ref.watch(
      quizContentNotifierProvider.select((value) => value.solution),
    );
    final answers = ref.watch(
      quizContentNotifierProvider.select((value) => value.answers),
    );

    if (solution == null) {
      return const SizedBox();
    }
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        ref.read(quizContentNotifierProvider.notifier).resetState();
        return true;
      },
      child: Scaffold(
        appBar: CBAppBar(
          title: 'Quiz - ${viewedContent.name}',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ...viewedContent.questions.map(
                      (q) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: ExpansionTile(
                                childrenPadding: const EdgeInsets.only(
                                  left: 16,
                                  right: 24,
                                  bottom: 12,
                                ),
                                title: Row(
                                  children: [
                                    solution.correctAnswerQuestionIds
                                            .contains(q.id)
                                        ? Assets.images.circleCheck.svg(
                                            width: 20,
                                            height: 20,
                                            color: Colors.green[600],
                                          )
                                        : Assets.images.circleX.svg(
                                            width: 20,
                                            height: 20,
                                            color: colors.destructive,
                                          ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        q.question,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your answer was',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: colors.mutedForeground,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          answers
                                                      .firstWhere(
                                                        (a) => a.$1 == q.id,
                                                        orElse: () => (-1, -1),
                                                      )
                                                      .$2 >=
                                                  0
                                              ? q.answers[answers
                                                  .firstWhere(
                                                    (a) => a.$1 == q.id,
                                                  )
                                                  .$2]
                                              : 'No answer',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
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
              const Spacer(),
              QuizBottomActions(viewedContent, courseId),
              SizedBox(height: bottomPadding + 10),
            ],
          ),
        ),
      ),
    );
  }
}
