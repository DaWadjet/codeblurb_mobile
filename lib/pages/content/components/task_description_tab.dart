import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/hints_section.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TaskDescriptionTab extends HookWidget {
  const TaskDescriptionTab({
    required this.onShowHints,
    required this.shownHintCount,
    required this.onStart,
    required this.viewedContent,
    required this.startText,
    super.key,
  });

  final VoidCallback onShowHints;
  final int shownHintCount;
  final CodingContentResponse viewedContent;
  final String startText;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = context.bottomPadding;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                viewedContent.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Task Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          viewedContent.shortDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              HintsSecton(
                hints: viewedContent.hints,
                onShowHints: onShowHints,
                shownHintCount: shownHintCount,
              ),
              SizedBox(height: 60 + bottomPadding),
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
                    onPressed: onStart,
                    child: Text(
                      startText,
                      style: const TextStyle(
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
