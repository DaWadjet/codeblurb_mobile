// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/custom_will_pop.dart';
import 'package:codeblurb_mobile/pages/content/components/task_description_tab.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/drag_and_drop_provider.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/drag_and_drop_task_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DragAndDropContentPage extends HookConsumerWidget {
  const DragAndDropContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final CodingContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final tabBarColors = Theme.of(context).tabBarTheme;
    final state = ref.watch(dragAndDropNotifierProvider);

    ref.listen(
        dragAndDropNotifierProvider.select((value) => value.tabControllerIndex),
        (previous, next) {
      tabController.animateTo(next);
    });
    final tabIndex = ref.watch(
      dragAndDropNotifierProvider.select((value) => value.tabControllerIndex),
    );

    useEffect(
      () {
        void listener() {
          if (tabController.index !=
              ref.read(dragAndDropNotifierProvider).tabControllerIndex) {
            ref
                .read(dragAndDropNotifierProvider.notifier)
                .setTabControllerIndex(
                  tabController.index,
                );
          }
        }

        tabController.addListener(listener);
        return () {
          tabController.removeListener(listener);
        };
      },
      [tabController.index],
    );

    useEffect(
      () {
        Future.delayed(
          Duration.zero,
          () => ref
              .read(dragAndDropNotifierProvider.notifier)
              .initChoices(viewedContent.codeSnippets),
        );
        return null;
      },
      [],
    );

    return CustomWillPop(
      onPop: ref.read(dragAndDropNotifierProvider.notifier).resetState,
      skipCheck: state.solution != null,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                icon: Assets.images.assignment.svg(
                  color: tabIndex == 0
                      ? tabBarColors.labelColor
                      : tabBarColors.unselectedLabelColor,
                ),
                text: 'Task',
              ),
              Tab(
                icon: Assets.images.exercise.svg(
                  color: tabIndex == 1
                      ? tabBarColors.labelColor
                      : tabBarColors.unselectedLabelColor,
                ),
                text: 'Exercise',
              ),
            ],
          ),
          title: const Text('Drag & Drop'),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            TaskDescriptionTab(
              onShowHints: () =>
                  ref.read(dragAndDropNotifierProvider.notifier).showHint(),
              shownHintCount: state.shownHints,
              onStart: () {
                ref
                    .read(dragAndDropNotifierProvider.notifier)
                    .setTabControllerIndex(1);
              },
              viewedContent: viewedContent,
              startText: "Let's do it!",
            ),
            DragAndDropTaskTab(
              viewedContent: viewedContent,
              courseId: courseId,
            ),
          ],
        ),
      ),
    );
  }
}
