// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/custom_will_pop.dart';
import 'package:codeblurb_mobile/pages/content/scratch_content/scratch_provider.dart';
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
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
    final tabBarColors = Theme.of(context).tabBarTheme;

    final shownHintCount =
        ref.watch(scratchNotifierProvider.select((value) => value.shownHints));

    ref.listen(
        scratchNotifierProvider.select((value) => value.tabControllerIndex),
        (previous, next) {
      tabController.animateTo(next);
    });

    final tabIndex = ref.watch(
        scratchNotifierProvider.select((value) => value.tabControllerIndex));

    final tabs = useMemoized(
      () => [
        Tab(
          icon: Assets.images.assignment.svg(
            color: tabIndex == 0
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Task',
        ),
        Tab(
          icon: Assets.images.code.svg(
            color: tabIndex == 1
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Code',
        ),
        Tab(
          icon: Assets.images.results.svg(
            color: tabIndex == 2
                ? tabBarColors.labelColor
                : tabBarColors.unselectedLabelColor,
          ),
          text: 'Results',
        ),
      ],
      [tabIndex],
    );

    useEffect(
      () {
        tabController.addListener(() {
          ref.read(scratchNotifierProvider.notifier).setTabControllerIndex(
                tabIndex,
              );
          FocusManager.instance.primaryFocus?.unfocus();
        });
        return null;
      },
      [tabController],
    );
    return CustomWillPop(
      onPop: ref.read(scratchNotifierProvider.notifier).resetState,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: tabs,
          ),
          title: const Text('Scratch'),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
