import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drag_and_drop_provider.freezed.dart';
part 'drag_and_drop_provider.g.dart';

@freezed
class DragAndDropState with _$DragAndDropState {
  const factory DragAndDropState({
    required bool isLoading,
  }) = _DragAndDropState;
}

@riverpod
class DragAndDropNotifier extends _$DragAndDropNotifier {
  @override
  DragAndDropState build() {
    return const DragAndDropState(
      isLoading: false,
    );
  }

  void resetState() {
    state = const DragAndDropState(
      isLoading: false,
    );
  }

  Future<bool> submitDragAndDropSolution({
    required int contentId,
    required int courseId,
    required List<String> solutions,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(contentRepositoryProvider).sendCodeQuizSolutionResultFor(
            contentId: contentId,
            solutions: solutions,
          );
      unawaited(ref.refresh(contentBundleQueryProvider(courseId).future));
      ref.invalidate(contentBundlesQueryProvider);
      state = state.copyWith(
        isLoading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false);
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to submit solution');
      return false;
    }
  }
}
