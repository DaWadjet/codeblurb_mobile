import 'package:codeblurb_mobile/app_constants.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BriefInfo extends HookWidget {
  const BriefInfo({
    super.key,
    this.skillLevel,
    this.technologies,
  });

  final SkillLevel? skillLevel;
  final String? technologies;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return Text(
      skillLevel == null
          ? technologies ?? AppConstants.technologies
          // ignore: lines_longer_than_80_chars
          : '${technologies ?? AppConstants.technologies} - ${skillLevel!.value}',
      style: TextStyle(
        fontSize: 12,
        color: colors.mutedForeground,
      ),
    );
  }
}
