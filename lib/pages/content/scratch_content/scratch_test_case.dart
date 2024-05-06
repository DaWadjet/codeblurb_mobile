import 'package:codeblurb_mobile/network/models/test_case_response.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScratchTestCase extends HookConsumerWidget {
  const ScratchTestCase({required this.testCase, super.key,
  });

  final TestCaseResponse testCase;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final correspondingEvaluatedTestCase = ref.watch(scratchNotifierProvider.select((value) => value.solution?.results.firstWhere((element) => element.testCaseId == testCase., orElse: () => null));

    return Padding(
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
                  solution.correctAnswerQuestionIds.contains(q.id)
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
                      'Test Case ${q.id + 1}',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
