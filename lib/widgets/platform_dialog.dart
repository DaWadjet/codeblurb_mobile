import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDialog<T> extends StatelessWidget {
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
  final T Function()? onTap;
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
                key: Keys.areYouSure_confirm,
                onPressed: () {
                  final result = onTap?.call();
                  context.router.maybePop(result);
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
                key: Keys.areYouSure_confirm,
                onPressed: () {
                  final result = onTap?.call();
                  context.router.maybePop(result);
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
