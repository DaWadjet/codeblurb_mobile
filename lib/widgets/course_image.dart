import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CourseImage extends HookWidget {
  const CourseImage({
    required this.imageUrl,
    super.key,
    this.height,
    this.width,
    this.withBorderRadius = true,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final bool withBorderRadius;
  @override
  Widget build(BuildContext context) {
    final colors = useColors();

    final image = CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      fit: BoxFit.cover,
      height: height,
      width: width ?? height,
      errorWidget: (context, url, error) => ColoredBox(
        color: colors.accent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'No image available',
              style: TextStyle(
                color: colors.mutedForeground,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    if (withBorderRadius) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: image,
      );
    } else {
      return image;
    }
  }
}
