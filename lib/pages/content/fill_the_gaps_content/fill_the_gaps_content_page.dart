// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/custom_will_pop.dart';
import 'package:codeblurb_mobile/pages/content/components/task_description_tab.dart';
import 'package:codeblurb_mobile/pages/content/fill_the_gaps_content/fill_the_gaps_provider.dart';
import 'package:codeblurb_mobile/pages/content/fill_the_gaps_content/fill_the_gaps_task_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class FillTheGapsContentPage extends HookConsumerWidget {
  const FillTheGapsContentPage({
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

    ref.listen(
        fillTheGapsNotifierProvider.select((value) => value.tabControllerIndex),
        (previous, next) {
      tabController.animateTo(next);
    });

    final state = ref.watch(fillTheGapsNotifierProvider);

    final tabs = useMemoized(
      () => [
        Tab(
          icon: Assets.images.assignment.svg(
            color: state.tabControllerIndex == 0
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Task',
        ),
        Tab(
          icon: Assets.images.exercise.svg(
            color: state.tabControllerIndex == 1
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Exercise',
        ),
      ],
      [state.tabControllerIndex],
    );

    useEffect(
      () {
        void listener() {
          if (tabController.index !=
              ref.read(fillTheGapsNotifierProvider).tabControllerIndex) {
            ref
                .read(fillTheGapsNotifierProvider.notifier)
                .setTabControllerIndex(
                  tabController.index,
                );
            FocusManager.instance.primaryFocus?.unfocus();
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
              .read(fillTheGapsNotifierProvider.notifier)
              .initEditedSolutions(viewedContent.codeSkeleton.length - 1),
        );
        return null;
      },
      [],
    );

    return CustomWillPop(
      skipCheck: state.solution != null,
      onPop: ref.read(fillTheGapsNotifierProvider.notifier).resetState,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: tabs,
          ),
          title: const Text('Fill In The Gaps'),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            TaskDescriptionTab(
              onShowHints: () =>
                  ref.read(fillTheGapsNotifierProvider.notifier).showHint(),
              shownHintCount: state.shownHints,
              onStart: () {
                ref
                    .read(fillTheGapsNotifierProvider.notifier)
                    .setTabControllerIndex(1);
              },
              viewedContent: viewedContent,
              startText: "Let's do it!",
            ),
            FillTheGapsTaskTab(
              viewedContent: viewedContent,
              courseId: courseId,
            ),
          ],
        ),
      ),
    );
  }
}
