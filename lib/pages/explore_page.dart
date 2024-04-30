import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key, this.filterProps});

  final PageProps? filterProps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ExplorePage${filterProps?.toQueryParameters()}'),
      ),
    );
  }
}
