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
            color: Theme.of(context).colorScheme.background.withOpacity(0.2),
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
