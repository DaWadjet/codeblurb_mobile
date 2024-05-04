// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
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

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
        ),
        title: const Text('Coding task 1'),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(
            child: Text('Task'),
          ),
          Center(
            child: Text('Exercise'),
          ),
        ],
      ),
    );
  }
}
