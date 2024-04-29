import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/pages/my_courses/my_courses_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sortOptions = [
  SortBy.none(),
  SortBy.recentlyViewed(),
  SortBy.recentlyEnrolled(),
  SortBy.titleAToZ(),
  SortBy.titleZToA(),
];

@RoutePage()
class MyCoursesPage extends HookConsumerWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = useState(SortBy.none());
    final skillLevels = useState<List<SkillLevel>>([SkillLevel.advanced]);
    final myCourses = ref.watch(contentBundlesQueryProvider());
    final fullHeight = MediaQuery.of(context).size.height;
    final colors = useColors();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        forceMaterialTransparency: true,
      ),
      body: AdaptivePullToRefresh(
        onRefresh: ref.watch(myCoursesNotifierProvider.notifier).onRefresh,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: myCourses.when(
            data: (data) {
              if (data.content.isEmpty) {
                return Padding(
                  padding: EdgeInsets.only(top: fullHeight / 3),
                  key: const ValueKey('empty'),
                  child: const Center(
                    child: Text('You have not purchased any courses yet'),
                  ),
                );
              }
              return Column(
                children: [
                  DropdownSearch<String>(
                    popupProps: PopupProps.modalBottomSheet(
                      showSelectedItems: true,
                      itemBuilder: (context, item, isSelected) {
                        return TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              isSelected
                                  ? Assets.images.circleCheck.svg(
                                      width: 20,
                                      height: 20,
                                      // ignore: deprecated_member_use_from_same_package
                                      color: colors.foreground,
                                    )
                                  : const SizedBox(
                                      width: 16,
                                    ),
                              const SizedBox(width: 16),
                              Text(
                                item,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? colors.foreground
                                      : colors.foreground.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      containerBuilder: (context, popupWidget) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colors.muted,
                            border: Border.all(
                              color: colors.muted,
                              width: 1.5,
                            ),
                          ),
                          child: popupWidget,
                        );
                      },
                    ),
                    items: sortOptions.map((e) => e.label).toList(),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: 'Sort by',
                        labelStyle: TextStyle(
                          color: colors.foreground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      filter.value = sortOptions.firstWhere(
                        (element) => element.label == value,
                      );
                    },
                    selectedItem: filter.value.label,
                  ),
                  DropdownSearch.multiSelection(
                    // popupProps: PopupProps.modalBottomSheet(
                    //   showSelectedItems: true,
                    //   itemBuilder: (context, item, isSelected) {
                    //     return TextButton(
                    //       onPressed: () {},
                    //       child: Row(
                    //         children: [
                    //           isSelected
                    //               ? Assets.images.circleCheck.svg(
                    //                   width: 20,
                    //                   height: 20,
                    //                   // ignore: deprecated_member_use_from_same_package
                    //                   color: colors.foreground,
                    //                 )
                    //               : const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //           const SizedBox(width: 16),
                    //           Text(
                    //             item,
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.w600,
                    //               color: isSelected
                    //                   ? colors.foreground
                    //                   : colors.foreground.withOpacity(0.6),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    //   containerBuilder: (context, popupWidget) {
                    //     return Container(
                    //       padding: const EdgeInsets.all(16),
                    //       height: 320,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12),
                    //         color: colors.muted,
                    //         border: Border.all(
                    //           color: colors.muted,
                    //           width: 1.5,
                    //         ),
                    //       ),
                    //       child: popupWidget,
                    //     );
                    //   },
                    // ),

                    items: SkillLevel.values,
                    itemAsString: (item) => item.value,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        label: const Text('Skill Level'),
                        labelStyle: TextStyle(
                          color: colors.foreground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      final newValues = value.map((e) {
                        return SkillLevel.values.firstWhere(
                          (element) => element == e,
                        );
                      }).toList();
                      if (newValues.length == SkillLevel.values.length) {
                        skillLevels.value = [];
                      } else {
                        skillLevels.value = newValues;
                      }
                    },
                    selectedItems: skillLevels.value,
                  ),
                  ...data.content.map(
                    (item) => Text(item.title),
                  ),
                ],
              );
            },
            error: (e, stackTrace) => Padding(
              padding: EdgeInsets.only(top: fullHeight / 3),
              child: const Center(
                key: ValueKey('error'),
                child: Text('An error occurred\nPlease try again later'),
              ),
            ),
            loading: () => Padding(
              padding: EdgeInsets.only(top: fullHeight / 3),
              child: const Center(
                key: ValueKey('loading'),
                child: Loader(
                  size: 48,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
