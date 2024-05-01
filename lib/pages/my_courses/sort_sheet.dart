import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final myCoursesSortOptions = [
  SortBy.none(),
  SortBy.recentlyViewed(),
  SortBy.recentlyEnrolled(),
  SortBy.titleAToZ(),
  SortBy.titleZToA(),
];

final exploreSortOptions = [
  SortBy.none(),
  SortBy.mostPopular(),
  SortBy.freshlyReleased(),
  SortBy.priceAscending(),
  SortBy.priceDescending(),
  SortBy.highestRated(),
  SortBy.titleAToZ(),
  SortBy.titleZToA(),
];

class SortSheet extends HookWidget {
  const SortSheet({
    required this.initialValue,
    this.isMyCourses = true,
    super.key,
  });

  final PageProps initialValue;
  final bool isMyCourses;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    final bottomPadding = context.bottomPadding;
    final sortOptions = useMemoized(
      () => isMyCourses ? myCoursesSortOptions : exploreSortOptions,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Container(
          width: 40,
          height: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: colors.border,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...sortOptions.map(
                (e) => TextButton(
                  onPressed: () {
                    context.router.popForced(e);
                  },
                  child: Text(
                    e.label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: initialValue.label == e.label
                          ? colors.foreground
                          : colors.mutedForeground,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        SizedBox(
          height: bottomPadding,
        ),
      ],
    );
  }
}
