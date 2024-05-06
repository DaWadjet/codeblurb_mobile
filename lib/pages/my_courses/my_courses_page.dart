// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/app_constants.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/pages/my_courses/my_courses_list_item.dart';
import 'package:codeblurb_mobile/pages/my_courses/my_courses_provider.dart';
import 'package:codeblurb_mobile/pages/my_courses/skill_level_filter_sheet.dart';
import 'package:codeblurb_mobile/pages/my_courses/sort_sheet.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/full_page_message.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MyCoursesPage extends HookConsumerWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();

    final filter = useState(SortBy.recentlyViewed());
    final skillLevels = useState<List<SkillLevel>>([]);

    final controller = useTextEditingController();
    final searchValue = useState('');

    final debouncedSearchValue =
        useDebounced(searchValue.value, const Duration(seconds: 1));

    final pageProps = useMemoized(
      () => filter.value.copyWith(
        skills: skillLevels.value.map((e) => e.value).toList(),
        title: debouncedSearchValue ?? '',
      ),
      [filter.value, skillLevels.value, debouncedSearchValue],
    );

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: InputField(
          textCapitalization: TextCapitalization.none,
          controller: controller,
          onChanged: (newValue) => searchValue.value = newValue ?? '',
          hint: 'Search your courses',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final newSkillFilterValues =
                  await context.showBottomSheet<List<SkillLevel>>(
                content: SkillLevelSheet(initialValues: skillLevels.value),
              );

              if (newSkillFilterValues != null) {
                skillLevels.value =
                    newSkillFilterValues.length == SkillLevel.values.length
                        ? []
                        : newSkillFilterValues;
              }
            },
            icon: Assets.images.filter.svg(
              color: colors.foreground,
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () async {
              final newSort = await context.showBottomSheet<PageProps>(
                content: SortSheet(initialValue: filter.value),
              );
              filter.value = newSort ?? filter.value;
            },
            icon: Assets.images.sort.svg(
              color: colors.foreground,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: AdaptivePullToRefresh(
        onRefresh: () =>
            ref.watch(myCoursesNotifierProvider.notifier).onRefresh(pageProps),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final page = index ~/ AppConstants.pageSize;
                  final itemIndex = index % AppConstants.pageSize;
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
                            if (page == 0) {
                              return const FullPageLoader(
                                key: ValueKey('loader'),
                              );
                            }
                          } else {
                            const Loader(
                              size: 32,
                              key: ValueKey('smallLoader'),
                            );
                          }
                          return null;
                        },
                        data: (data) {
                          if (data.totalElements == 0 && index == 0) {
                            return const FullPageMessage(
                              message: 'No courses found',
                            );
                          }
                          if (page >= data.totalPages ||
                              itemIndex >= data.content.length) {
                            return null;
                          }
                          final content = data.content[itemIndex];

                          return MyCoursesListItem(
                            content: content,
                            key: ValueKey(content.id),
                          );
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
