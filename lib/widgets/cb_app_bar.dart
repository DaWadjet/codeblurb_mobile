import 'package:flutter/material.dart';

class CBAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CBAppBar({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: title != null ? Text(title!) : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
