// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/custom_will_pop.dart';
import 'package:codeblurb_mobile/pages/content/components/task_description_tab.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/coding_tab.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_results_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ScratchContentPage extends HookConsumerWidget {
  const ScratchContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final CodingContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);
    final textEditingController = useTextEditingController(
      text: viewedContent.codeSkeleton.join('\n').replaceAll(
            // RegExp(r'^\s+', multiLine: true),
            RegExp(r'^\s{10}', multiLine: true),

            '\t',
          ),
    );
    final node = useFocusNode();
    final tabBarColors = Theme.of(context).tabBarTheme;

    final state = ref.watch(scratchNotifierProvider);

    ref.listen(
        scratchNotifierProvider.select((value) => value.tabControllerIndex),
        (previous, next) {
      if (next != tabController.index) {
        tabController.animateTo(next);
      }
    });

    useEffect(
      () {
        textEditingController.addListener(() {
          ref
              .read(scratchNotifierProvider.notifier)
              .setCode(textEditingController.text);
        });

        return null;
      },
      [],
    );

    useEffect(
      () {
        if (state.tabControllerIndex == 1) {
          node.requestFocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        return null;
      },
      [state.tabControllerIndex],
    );

    useEffect(
      () {
        tabController.addListener(() {
          ref.read(scratchNotifierProvider.notifier).setTabControllerIndex(
                tabController.index,
              );
        });
        return null;
      },
    );
    return CustomWillPop(
      skipCheck: state.solution != null,
      onPop: ref.read(scratchNotifierProvider.notifier).resetState,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                icon: Assets.images.assignment.svg(
                  color: state.tabControllerIndex == 0
                      ? tabBarColors.labelColor
                      : tabBarColors.unselectedLabelColor,
                ),
                text: 'Task',
              ),
              Tab(
                icon: Assets.images.code.svg(
                  color: state.tabControllerIndex == 1
                      ? tabBarColors.labelColor
                      : tabBarColors.unselectedLabelColor,
                ),
                text: 'Code',
              ),
              Tab(
                icon: Assets.images.results.svg(
                  color: state.tabControllerIndex == 2
                      ? tabBarColors.labelColor
                      : tabBarColors.unselectedLabelColor,
                ),
                text: 'Results',
              ),
            ],
          ),
          title: const Text('Scratch'),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            TaskDescriptionTab(
              onShowHints: ref.read(scratchNotifierProvider.notifier).showHint,
              shownHintCount: state.shownHints,
              onStart: () {
                ref
                    .read(scratchNotifierProvider.notifier)
                    .setTabControllerIndex(
                      1,
                    );
                node.requestFocus();
              },
              viewedContent: viewedContent,
              startText: 'Start Coding!',
            ),
            CodingTab(
              node: node,
              textEditingController: textEditingController,
              contentId: viewedContent.id,
              courseId: courseId,
            ),
            ScratchResultsTab(
              viewedContent: viewedContent,
              courseId: courseId,
            ),
          ],
        ),
      ),
    );
  }
}
