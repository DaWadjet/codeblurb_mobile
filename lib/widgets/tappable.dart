import 'package:flutter/material.dart';

class Tappable extends StatelessWidget {
  const Tappable({
    required this.child,
    required this.onTap,
    super.key,
    this.borderRadius = 8,
  });

  final double borderRadius;
  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
