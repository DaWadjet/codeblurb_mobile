import 'package:flutter/material.dart';

class ScrollableView<T> extends StatelessWidget {
  const ScrollableView({
    required this.items,
    required this.title,
    required this.ctor,
    super.key,
  });

  final List<T> items;
  final Widget Function(T) ctor;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 244,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...[
                ...items,
                ...items,
              ].map(
                ctor,
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
