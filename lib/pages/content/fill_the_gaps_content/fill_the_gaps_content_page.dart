// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/hints_section.dart';
import 'package:codeblurb_mobile/pages/content/fill_the_gaps_content/fill_the_gaps_provider.dart';
import 'package:codeblurb_mobile/widgets/platform_dialog.dart';
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
    final bottomPadding = context.bottomPadding;
    final tabBarColors = Theme.of(context).tabBarTheme;

    final shownHintCount = ref
        .watch(fillTheGapsNotifierProvider.select((value) => value.shownHints));

    ref.listen(
        fillTheGapsNotifierProvider.select((value) => value.tabControllerIndex),
        (previous, next) {
      tabController.animateTo(next);
    });

    final tabs = useMemoized(
      () => [
        Tab(
          icon: Assets.images.assignment.svg(
            color: tabController.index == 0
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Task',
        ),
        Tab(
          icon: Assets.images.exercise.svg(
            color: tabController.index == 1
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Exercise',
        ),
      ],
      [tabController.index],
    );

    useEffect(
      () {
        tabController.addListener(() {
          FocusManager.instance.primaryFocus?.unfocus();
        });
        return null;
      },
      [tabController],
    );

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (_) => PlatformDialog(
            secondaryActionTitle: 'Cancel',
            title: 'Are you sure you want to leave?',
            subtitle: 'Submit your solution first to save your progress',
            onTap: () => true,
          ),
        );
        if (shouldPop ?? false) {
          ref.read(fillTheGapsNotifierProvider.notifier).resetState();
        }
        return shouldPop ?? false;
      },
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
                    hints: const [
                      'egy agd  l;has lk;sda ;jasdg ;khas;dk ;s; ajkasldghis;dligsha;igl',
                      'kettő',
                      'három',
                    ],
                    onShowHints:
                        ref.read(fillTheGapsNotifierProvider.notifier).showHint,
                    shownHintCount: shownHintCount,
                  ),
                  SizedBox(height: bottomPadding + 10),
                ],
              ),
            ),
            const Center(
              child: Text('Exercise'),
            ),
          ],
        ),
      ),
    );
  }
}
