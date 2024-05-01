import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/ratings_response.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:codeblurb_mobile/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RatingDistribution extends HookWidget {
  const RatingDistribution({required this.ratings, super.key});

  final RatingsResponse ratings;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    final (distribution, percentages) = useMemoized(
      () {
        final initialRatingDistribution = {
          1: 0,
          2: 0,
          3: 0,
          4: 0,
          5: 0,
        };
        final initialPercentages = {
          1: 0.0,
          2: 0.0,
          3: 0.0,
          4: 0.0,
          5: 0.0,
        };

        for (final element in ratings.ratings) {
          if (initialRatingDistribution[element.rating] != null) {
            initialRatingDistribution[element.rating] =
                initialRatingDistribution[element.rating]! + 1;
          }
        }
        final totalRatings = ratings.numberOfRatings;
        for (final key in initialRatingDistribution.keys) {
          initialPercentages[key] =
              initialRatingDistribution[key]! / totalRatings;
        }
        return (initialRatingDistribution, initialPercentages);
      },
      [ratings.numberOfRatings],
    );

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Course Rating: ${ratings.averageRating.toStringAsFixed(1)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              ratings.numberOfRatings > 0
                  ? 'out of ${ratings.numberOfRatings} ratings'
                  : 'No ratings yet',
              style: TextStyle(
                fontSize: 14,
                color: colors.mutedForeground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        for (final key in distribution.keys.toList().reversed) ...[
          Row(
            children: [
              Expanded(
                child: AppProgressBar(
                  progress: percentages[key] ?? 0,
                  withText: false,
                  height: 12,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Rating(
                initialRating: key.toDouble(),
                itemSize: 18,
                itemPadding: 2,
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 12),
      ],
    );
  }
}
