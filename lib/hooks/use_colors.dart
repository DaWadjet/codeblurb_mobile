import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/theme/colors/codeblurb_colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ColorPalette useColors() {
  return useContext().appColors;
}
