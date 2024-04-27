import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizContentPage extends StatelessWidget {
  const QuizContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('QuizContentPage'),
      ),
    );
  }
}
