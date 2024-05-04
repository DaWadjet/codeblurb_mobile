import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fill_the_gaps_provider.freezed.dart';
part 'fill_the_gaps_provider.g.dart';

@freezed
class FillTheGapsState with _$FillTheGapsState {
  const factory FillTheGapsState({
    required bool isLoading,
  }) = _FillTheGapsState;
}

@riverpod
class FillTheGapsNotifier extends _$FillTheGapsNotifier {
  @override
  FillTheGapsState build() {
    return const FillTheGapsState(
      isLoading: false,
    );
  }

  void resetState() {
    state = const FillTheGapsState(
      isLoading: false,
    );
  }

  Future<bool> submitFillTheGapsSolution({
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
