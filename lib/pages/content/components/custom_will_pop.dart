import 'package:codeblurb_mobile/widgets/platform_dialog.dart';
import 'package:flutter/material.dart';

class CustomWillPop extends StatelessWidget {
  const CustomWillPop({required this.child, required this.onPop, super.key});

  final Widget child;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (_) => PlatformDialog(
            secondaryActionTitle: 'Cancel',
            title: 'Are you sure you want to leave?',
            subtitle: 'Submit your solution first to save your progress',
            onTap: () => true,
          ),
        );
        if (shouldPop ?? false) {
          onPop();
        }
        return shouldPop ?? false;
      },
      child: child,
    );
  }
}
