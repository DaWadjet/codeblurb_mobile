import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/video_content_response.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VideoContentPage extends StatelessWidget {
  const VideoContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final VideoContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('VideoContentPage'),
      ),
    );
  }
}
