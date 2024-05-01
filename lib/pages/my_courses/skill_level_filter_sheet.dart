import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SkillLevelSheet extends StatefulHookWidget {
  const SkillLevelSheet({
    required this.initialValues,
    super.key,
  });

  final List<SkillLevel> initialValues;

  @override
  State<SkillLevelSheet> createState() => _SkillLevelSheetState();
}

class _SkillLevelSheetState extends State<SkillLevelSheet> {
  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
    final skillLevels = useState<List<SkillLevel>>([...widget.initialValues]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: colors.border,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Text(
                'Pick Skill Level',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...SkillLevel.values.map(
                (e) => Tappable(
                  onTap: () {},
                  child: CheckboxListTile(
                    value: skillLevels.value.contains(e),
                    title: Text(
                      e.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (value) {
                      if (value ?? false) {
                        skillLevels.value.add(e);
                      } else {
                        skillLevels.value.remove(e);
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.router.popForced(skillLevels.value),
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: bottomPadding,
        ),
      ],
    );
  }
}
