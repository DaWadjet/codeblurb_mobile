import 'package:codeblurb_mobile/pages/content/scratch_content/character_insertion_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CodingTab extends HookConsumerWidget {
  const CodingTab({
    required this.node,
    required this.textEditingController,
    super.key,
  });

  final FocusNode node;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        focusNode: node,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        enableSuggestions: false,
                        decoration: null,
                        autocorrect: false,
                        controller: textEditingController,
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    child: node.hasFocus
                        ? CharacterInsertionRow(
                            key: const ValueKey('keyboard'),
                            controller: textEditingController,
                            onUnfocus: node.unfocus,
                            onRunCode: () {},
                          )
                        : const SizedBox(
                            key: ValueKey('empty'),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
