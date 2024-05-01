import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/pages/my_courses/my_courses_list_item.dart';
import 'package:codeblurb_mobile/pages/my_courses/my_courses_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
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
    final skillLevels = useState<List<SkillLevel>>([]);
    final controller = useTextEditingController();
    final debouncedSearchValue =
        useDebounced(controller.text, const Duration(seconds: 1));

    final pageProps = useMemoized(
      () => filter.value.copyWith(
        skills: skillLevels.value.map((e) => e.value).toList(),
        title: debouncedSearchValue ?? '',
      ),
      [filter.value, skillLevels.value, debouncedSearchValue],
    );

    final colors = useColors();

    return Scaffold(
      appBar: const CBAppBar(
        title: 'My Courses',
      ),
      body: AdaptivePullToRefresh(
        onRefresh: () =>
            ref.watch(myCoursesNotifierProvider.notifier).onRefresh(pageProps),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InputField(
                controller: controller,
                hint: 'Search',
              ),
              const SizedBox(width: 16),
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
                        color: colors.border,
                        border: Border.all(
                          color: colors.border,
                          width: 1.5,
                        ),
                      ),
                      child: popupWidget,
                    );
                  },
                ),
                selectedItem: filter.value.label,
                items: sortOptions.map((e) => e.label).toList(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                  ),
                ),
                onChanged: (value) {
                  filter.value = sortOptions.firstWhere(
                    (element) => element.label == value,
                  );
                },
                dropdownButtonProps: DropdownButtonProps(
                  icon: Assets.images.chevronDown.svg(
                    width: 20,
                    height: 20,
                    // ignore: deprecated_member_use_from_same_package
                    color: colors.foreground,
                  ),
                ),
                dropdownBuilder: (context, selectedItem) => Text(
                  selectedItem ?? 'None',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownSearch.multiSelection(
                popupProps:
                    PopupPropsMultiSelection<SkillLevel>.modalBottomSheet(
                  containerBuilder: (context, popupWidget) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colors.border,
                        border: Border.all(
                          color: colors.border,
                          width: 1.5,
                        ),
                      ),
                      child: popupWidget,
                    );
                  },
                  itemBuilder: (context, item, isSelected) {
                    return Text(
                      item.value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? colors.foreground
                            : colors.foreground.withOpacity(0.6),
                      ),
                    );
                  },
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                dropdownButtonProps: DropdownButtonProps(
                  icon: Assets.images.chevronDown.svg(
                    width: 20,
                    height: 20,
                    // ignore: deprecated_member_use_from_same_package
                    color: colors.foreground,
                  ),
                ),
                dropdownBuilder: (context, selectedItems) {
                  if (selectedItems.isEmpty) {
                    return const Text(
                      'All levels',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                  return Wrap(
                    spacing: 8,
                    children: selectedItems
                        .map(
                          (e) => Chip(
                            padding: EdgeInsets.zero,
                            label: Text(
                              e.value,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            backgroundColor: colors.accent,
                            onDeleted: () {
                              skillLevels.value = skillLevels.value
                                  .where((element) => element != e)
                                  .toList();
                            },
                          ),
                        )
                        .toList(),
                  );
                },
                items: SkillLevel.values,
                itemAsString: (item) => item.value,
                onChanged: (value) {
                  if (value.length == SkillLevel.values.length) {
                    skillLevels.value = [];
                    return;
                  }
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
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final page = index ~/ 2;
                  final itemIndex = index % 2;
                  return ref
                      .watch(
                        contentBundlesQueryProvider(
                          pageProps: pageProps.copyWith(page: page),
                        ),
                      )
                      .when(
                        error: (error, stackTrace) => null,
                        loading: () {
                          if (itemIndex == 0) {
                            return const Loader(
                              size: 48,
                            );
                          }
                          return null;
                        },
                        data: (data) {
                          if (page >= data.totalPages ||
                              itemIndex >= data.content.length) {
                            return null;
                          }
                          final content = data.content[itemIndex];

                          return MyCoursesListItem(content: content);
                        },
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
