// ignore_for_file: deprecated_member_use_from_same_package

import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CourseIcons extends HookWidget {
  const CourseIcons({
    required this.totalHours,
    required this.skillLevel,
    required this.releaseDate,
    super.key,
  });

  final int totalHours;
  final SkillLevel skillLevel;
  final DateTime releaseDate;

  @override
  Widget build(
    BuildContext context,
  ) {
    final colors = useColors();
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Assets.images.code.svg(
                    color: colors.mutedForeground,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const BriefInfo(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Assets.images.hourglass.svg(
                    color: colors.mutedForeground,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '$totalHours hours',
                    style: TextStyle(
                      fontSize: 12,
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Assets.images.badgeInfo.svg(
                    color: colors.mutedForeground,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    skillLevel.value,
                    style: TextStyle(
                      fontSize: 12,
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Assets.images.updatedAt.svg(
                    color: colors.mutedForeground,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    context.formatDate(
                      releaseDate,
                      'yy/MM/dd',
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
