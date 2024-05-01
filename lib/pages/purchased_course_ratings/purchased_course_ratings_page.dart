import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PurchasedCourseRatingsPage extends StatelessWidget {
  const PurchasedCourseRatingsPage({required this.courseId, super.key});

  final int courseId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PurchasedCourseRatingsPage'),
      ),
    );
  }
}
