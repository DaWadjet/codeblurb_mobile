import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizInitialContent extends HookConsumerWidget {
  const QuizInitialContent(this.viewedContent, {super.key});

  final QuizContentResponse viewedContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();

    return Column(
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
    );
  }
}
