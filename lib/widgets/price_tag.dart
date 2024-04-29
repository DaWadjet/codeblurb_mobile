import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PriceTag extends HookWidget {
  const PriceTag({
    required this.originalPrice,
    this.discount = false,
    super.key,
  });

  final double originalPrice;
  final bool discount;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    final priceBeforeDiscount = useMemoized(
      () => (discount ? (originalPrice * 1.2) + 9.99 : originalPrice),
      [originalPrice, discount],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${priceBeforeDiscount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: discount ? 14 : 16,
            letterSpacing: -0.5,
            decoration: discount ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w600,
            color: discount ? colors.mutedForeground : colors.foreground,
          ),
        ),
        if (discount) ...[
          const SizedBox(width: 6),
          Text(
            '\$${originalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}
