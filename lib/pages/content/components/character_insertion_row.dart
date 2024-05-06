import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/content/components/character_insertion_button.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterInsertionRow extends HookConsumerWidget {
  const CharacterInsertionRow({
    required this.onUnfocus,
    required this.onRunCode,
    required this.controller,
    super.key,
  });

  final VoidCallback onUnfocus;
  final VoidCallback onRunCode;
  final TextEditingController controller;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final bottomPadding = context.bottomPadding;
    final colors = useColors();
    return ColoredBox(
      color: colors.accent,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CharacterInsertionButton(
                      onTap: onUnfocus,
                      icon: Icons.keyboard_hide_outlined,
                    ),
                    CharacterInsertionButton(
                      buttonText: '{',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertCurlyBraces(controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: '}',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertCode('}', controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: ';',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertCode(';', controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: '"',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertQuotes(controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: '.',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertCode('.', controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: '[',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertSquareBrackets(controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: ']',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertCode(']', controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: '(',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertParentheses(controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: ')',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertCode(')', controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: '=',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertEqualSign(controller),
                    ),
                    CharacterInsertionButton(
                      buttonText: 'Tab',
                      onTap: () => ref
                          .read(scratchNotifierProvider.notifier)
                          .insertTab(controller),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.green.shade400,
                    ),
                    child: IconButton(
                      onPressed: onRunCode,
                      icon: Assets.images.play.svg(
                        // ignore: deprecated_member_use_from_same_package
                        color: colors.background,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
