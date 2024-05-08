import 'dart:async';

import 'package:codeblurb_mobile/network/models/code_quiz_solution_response.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fill_the_gaps_provider.freezed.dart';
part 'fill_the_gaps_provider.g.dart';

@freezed
class FillTheGapsState with _$FillTheGapsState {
  const factory FillTheGapsState({
    required bool isLoading,
    required List<String> editedSolutions,
    @Default(0) int shownHints,
    @Default(0) int tabControllerIndex,
    CodeQuizSolutionResponse? solution,
  }) = _FillTheGapsState;
}

@riverpod
class FillTheGapsNotifier extends _$FillTheGapsNotifier {
  @override
  FillTheGapsState build() {
    return const FillTheGapsState(
      isLoading: false,
      editedSolutions: [],
    );
  }

  void resetState({
    bool withoutPageReset = false,
  }) {
    state = FillTheGapsState(
      isLoading: false,
      editedSolutions: [],
      tabControllerIndex: withoutPageReset ? state.tabControllerIndex : 0,
    );
  }

  void initEditedSolutions(int length) {
    state = state.copyWith(
      editedSolutions: List<String>.filled(length, ''),
    );
  }

  void changeEditedSolution(int index, String solution) {
    final newEditedSolutions = List<String>.from(state.editedSolutions);
    newEditedSolutions[index] = solution;

    if (state.solution?.incorrectSolutions != null) {
      state.solution!.incorrectSolutions
          .removeWhere((s) => s.incorrectSolutionIndex == index);
    }
    if (state.solution?.correctAnswerIndices != null) {
      state.solution!.correctAnswerIndices.remove(index);
    }

    state = state.copyWith(
      editedSolutions: newEditedSolutions,
    );
  }

  Future<void> submitFillTheGapsSolution({
    required int contentId,
    required int courseId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      final response = await ref
          .read(contentRepositoryProvider)
          .sendCodeQuizSolutionResultFor(
            contentId: contentId,
            solutions: state.editedSolutions
                .map(
                  (e) => e.replaceAll(
                    //replace the incorrect quote
                    RegExp('“|”'),
                    '"',
                  ),
                )
                .toList(),
          );
      unawaited(ref.refresh(contentBundleQueryProvider(courseId).future));
      ref.invalidate(contentBundlesQueryProvider);
      state = state.copyWith(
        isLoading: false,
        solution: response,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to submit solution');
    }
  }

  void setTabControllerIndex(int index) {
    state = state.copyWith(tabControllerIndex: index);
  }

  void showHint() {
    state = state.copyWith(
      shownHints: state.shownHints + 1,
      tabControllerIndex: 0,
    );
  }
}
