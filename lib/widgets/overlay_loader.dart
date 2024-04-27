import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class OverlayLoader {
  static OverlayEntry? _currentLoader;

  static bool get isVisible => _currentLoader != null;

  static void show(BuildContext context) {
    if (_currentLoader != null) return;
    _currentLoader = OverlayEntry(
      builder: (context) => Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: context.appColors.white.withOpacity(0.3),
          ),
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_currentLoader!);
  }

  static void hide() {
    try {
      _currentLoader?.remove();
      _currentLoader = null;
    } catch (error) {
      // DO NOTHING
    }
  }
}
