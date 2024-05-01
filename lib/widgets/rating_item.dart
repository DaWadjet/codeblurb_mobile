import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/rating_response.dart';
import 'package:codeblurb_mobile/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RatingItem extends HookWidget {
  const RatingItem({required this.rating, super.key});

  final RatingResponse rating;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              rating.username,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              context.formatDate(rating.createdAt),
              style: TextStyle(
                fontSize: 12,
                color: colors.mutedForeground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Rating(
          initialRating: rating.rating.toDouble(),
          itemSize: 16,
          itemPadding: 2,
        ),
        const SizedBox(height: 16),
        Text(
          rating.comment,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    );
  }
}
