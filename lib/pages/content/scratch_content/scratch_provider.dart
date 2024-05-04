import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scratch_provider.freezed.dart';
part 'scratch_provider.g.dart';

@freezed
class ScratchState with _$ScratchState {
  const factory ScratchState({
    required bool isLoading,
    required String code,
  }) = _ScratchState;
}

@riverpod
class ScratchNotifier extends _$ScratchNotifier {
  @override
  ScratchState build() {
    return const ScratchState(
      isLoading: false,
      code: '',
    );
  }

  void resetState() {
    state = const ScratchState(
      isLoading: false,
      code: '',
    );
  }

  Future<bool> submitScratchSolution({
    required int contentId,
    required int courseId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(contentRepositoryProvider).sendCodeSolution(
            contentId: contentId,
            code: state.code,
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
