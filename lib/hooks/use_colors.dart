import 'package:codeblurb_mobile/theme/colors/codeblurb_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ColorPalette useColors() {
  final context = useContext();
  final colors = useMemoized(
    () => Theme.of(context).brightness == Brightness.light
        ? LightColors()
        : DarkColors(),
    [Theme.of(context).brightness],
  );
  return colors;
}
