import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PurchasedCourseDetailsPage extends StatelessWidget {
  const PurchasedCourseDetailsPage({
    required this.courseId,
    super.key,
  });

  final int courseId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PurchasedCourseDetailsPage $courseId'),
      ),
    );
  }
}
