import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharacterInsertionButton extends HookWidget {
  const CharacterInsertionButton({
    required this.onTap,
    super.key,
    this.buttonText,
    this.icon,
  });

  final String? buttonText;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return Tappable(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.accent,
        ),
        child: SizedBox(
          height: 40,
          width: 33,
          child: icon != null
              ? Icon(icon)
              : ColoredBox(
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      buttonText ?? '',
                      style: TextStyle(
                        color: colors.foreground,
                        fontSize: buttonText?.length == 1 ? 20 : 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
