import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends HookWidget {
  const Rating({
    super.key,
    this.initialRating,
    this.itemSize = 10,
    this.itemPadding = 0,
    this.onRatingUpdate,
  });

  final double? initialRating;
  final double itemSize;
  final double itemPadding;
  final ValueChanged<double>? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return RatingBar.builder(
      initialRating: initialRating ?? 0,
      minRating: 1,
      itemSize: itemSize,
      unratedColor: colors.mutedForeground,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, index) => index.toDouble() < (initialRating ?? 0)
          ? Assets.images.starFilled.svg(
              // ignore: deprecated_member_use_from_same_package
              color: Colors.amber,
            )
          : Assets.images.star.svg(
              // ignore: deprecated_member_use_from_same_package
              color: colors.mutedForeground,
            ),
      ignoreGestures: onRatingUpdate == null,
      onRatingUpdate: (rating) {
        onRatingUpdate?.call(rating);
      },
    );
  }
}
