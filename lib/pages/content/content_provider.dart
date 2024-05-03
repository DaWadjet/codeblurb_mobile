import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'content_provider.g.dart';

@riverpod
Section? nextSection(
  NextSectionRef ref, {
  required int courseId,
  required int currentContentId,
}) {
  final course = ref.watch(contentBundleQueryProvider(courseId));
  if (!course.hasValue) {
    return null;
  }

  return course.when(
    data: (data) {
      final sections = data.sections;
      final currentSectionIndex = sections
          .indexWhere((s) => (s.content as dynamic).id == currentContentId);

      if (currentSectionIndex == -1 ||
          currentSectionIndex == sections.length - 1) {
        return null;
      } else {
        return sections[currentSectionIndex + 1];
      }
    },
    error: (_, __) => null,
    loading: () => null,
  );
}

@riverpod
class ContentNotifier extends _$ContentNotifier {
  @override
  AsyncValue<int?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> markAsSeen({
    required int courseId,
    required int contentId,
  }) async {
    state = AsyncData(contentId);
    try {
      await ref
          .watch(
            progressRepositoryProvider,
          )
          .markAsSeen(
            contentId,
          );
      unawaited(ref.refresh(contentBundleQueryProvider(courseId).future));
      ref.invalidate(contentBundlesQueryProvider);
    } catch (e) {
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to mark content as seen');
    } finally {
      state = const AsyncData(null);
    }
  }

  Future<void> markAsCompleted({
    required int courseId,
    required int contentId,
  }) async {
    state = AsyncData(contentId);
    try {
      await ref
          .watch(
            progressRepositoryProvider,
          )
          .markAsCompleted(
            contentId,
          );
      unawaited(ref.refresh(contentBundleQueryProvider(courseId).future));
    } catch (e) {
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to mark content as completed');
    } finally {
      state = const AsyncData(null);
    }
  }
}
