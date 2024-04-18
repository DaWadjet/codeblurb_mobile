import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDialog extends StatelessWidget {
  const PlatformDialog({
    required this.title,
    super.key,
    this.subtitle,
    this.onTap,
    this.secondaryActionTitle,
    this.secondaryAction,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final String? secondaryActionTitle;
  final VoidCallback? secondaryAction;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(title),
            content: subtitle != null ? Text(subtitle!) : null,
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  onTap?.call();
                  context.router.maybePop();
                },
                child: const Text('Ok'),
              ),
              if (secondaryActionTitle != null)
                CupertinoDialogAction(
                  onPressed: secondaryAction,
                  child: Text(secondaryActionTitle!),
                ),
            ],
          )
        : AlertDialog(
            title: Text(title),
            content: subtitle != null ? Text(subtitle!) : null,
            actions: [
              TextButton(
                onPressed: () {
                  onTap?.call();
                  context.router.maybePop();
                },
                child: const Text('Ok'),
              ),
              if (secondaryActionTitle != null)
                TextButton(
                  onPressed: secondaryAction,
                  child: Text(secondaryActionTitle!),
                ),
            ],
          );
  }
}
