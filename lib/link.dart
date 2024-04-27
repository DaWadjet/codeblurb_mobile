import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  const Link({
    required this.route,
    super.key,
  });

  final PageRouteInfo<dynamic> route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(route);
      },
      child: Text(route.routeName),
    );
  }
}
