import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/pages/content/quiz_content/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizReviewUnsubmittedContent extends HookConsumerWidget {
  const QuizReviewUnsubmittedContent(
    this.viewedContent,
    this.courseId, {
    super.key,
  });

  final QuizContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final answers =
        ref.watch(quizContentNotifierProvider.select((value) => value.answers));

    return Column(
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
                onPressed: ref
                    .read(quizContentNotifierProvider.notifier)
                    .showPreviousQuestion,
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
                            title: Text(
                              q.question,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your answer is',
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
        ),
      ],
    );
  }
}
