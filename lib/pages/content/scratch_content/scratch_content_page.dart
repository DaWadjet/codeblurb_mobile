import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScratchContentPage extends StatelessWidget {
  const ScratchContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final CodingContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ScratchContentPage'),
      ),
    );
  }
}
