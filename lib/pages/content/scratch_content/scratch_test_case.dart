// ignore_for_file: deprecated_member_use_from_same_package

import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/outcome.dart';
import 'package:codeblurb_mobile/network/models/test_case_response.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScratchTestCase extends HookConsumerWidget {
  const ScratchTestCase({
    required this.testCase,
    required this.index,
    super.key,
  });

  final TestCaseResponse testCase;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final correspondingEvaluatedTestCase = ref.watch(
      scratchNotifierProvider.select((value) {
        if (value.solution == null) {
          return null;
        }
        if (value.solution!.results.length <= index) {
          return null;
        }
        return value.solution?.results[index];
      }),
    );

    final isLoading =
        ref.watch(scratchNotifierProvider.select((value) => value.isLoading));

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
              maintainState: true,
              childrenPadding: const EdgeInsets.only(
                left: 16,
                right: 24,
                bottom: 12,
              ),
              title: Row(
                children: [
                  if (isLoading)
                    const Loader(
                      size: 20,
                    ),
                  if (correspondingEvaluatedTestCase != null && !isLoading)
                    correspondingEvaluatedTestCase.outcome == Outcome.passed
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
                      'Test Case ${index + 1}',
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Input: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: colors.mutedForeground,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              testCase.input,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expected: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: colors.mutedForeground,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              testCase.expectedOutput,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (correspondingEvaluatedTestCase != null) ...[
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Actual: ',
                              style: TextStyle(
                                fontSize: 14,
                                color: colors.mutedForeground,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                correspondingEvaluatedTestCase.actual,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (correspondingEvaluatedTestCase.errors?.isNotEmpty ??
                            false)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Errors: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: colors.mutedForeground,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  correspondingEvaluatedTestCase.errors!,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
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
