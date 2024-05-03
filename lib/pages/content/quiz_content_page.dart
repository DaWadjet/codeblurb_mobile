import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizContentPage extends StatelessWidget {
  const QuizContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final QuizContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('QuizContentPage'),
      ),
    );
  }
}
