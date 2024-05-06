import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/ratings_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SmallRatingView extends HookWidget {
  const SmallRatingView({required this.ratings, super.key});

  final RatingsResponse? ratings;
  @override
  Widget build(BuildContext context) {
    final colors = useColors();

    if (ratings == null || ratings!.numberOfRatings == 0) {
      return Text(
        'No ratings yet',
        style: TextStyle(
          fontSize: 10,
          height: 1,
          color: colors.mutedForeground,
        ),
      );
    }
    return Row(
      children: [
        Text(
          (ratings?.averageRating ?? 0).toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 18,
            height: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Assets.images.starFilled.svg(
          // ignore: deprecated_member_use_from_same_package
          color: Colors.amber,
          width: 16,
        ),
        const SizedBox(width: 4),
        Text(
          '(${ratings!.numberOfRatings})',
          style: TextStyle(
            fontSize: 14,
            height: 1,
            color: colors.mutedForeground,
          ),
        ),
      ],
    );
  }
}
