import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    this.initialRating,
    this.canRate = false,
    this.itemSize = 10,
    this.itemPadding = 0,
  });

  final double? initialRating;
  final bool canRate;
  final double itemSize;
  final double itemPadding;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating ?? 0,
      minRating: 1,
      itemSize: itemSize,
      allowHalfRating: true,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, _) => Assets.images.star.svg(
        // ignore: deprecated_member_use_from_same_package
        color: Colors.amber,
      ),
      ignoreGestures: canRate,
      onRatingUpdate: (rating) {},
    );
  }
}
