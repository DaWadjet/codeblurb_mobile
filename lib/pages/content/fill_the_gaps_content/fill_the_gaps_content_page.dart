// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/custom_will_pop.dart';
import 'package:codeblurb_mobile/pages/content/components/task_description_tab.dart';
import 'package:codeblurb_mobile/pages/content/fill_the_gaps_content/fill_the_gaps_provider.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
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
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
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
        tabController.addListener(() {
          ref.read(fillTheGapsNotifierProvider.notifier).setTabControllerIndex(
                tabController.index,
              );
          FocusManager.instance.primaryFocus?.unfocus();
        });
        return null;
      },
      [tabController.index],
    );

    return CustomWillPop(
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
            Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Le task itself',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (state.shownHints < viewedContent.hints.length)
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Text(
                                'Need some help?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: colors.mutedForeground,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(
                                        fillTheGapsNotifierProvider.notifier,
                                      )
                                      .showHint();
                                },
                                child: const Text('Show hint'),
                              ),
                            ],
                          ),
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
                            child: const Text(
                              "Let's do it!",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () => ref
                                .read(fillTheGapsNotifierProvider.notifier)
                                .setTabControllerIndex(1),
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
            ),
          ],
        ),
      ),
    );
  }
}
