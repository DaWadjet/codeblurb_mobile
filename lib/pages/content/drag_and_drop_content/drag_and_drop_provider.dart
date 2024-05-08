import 'dart:async';

import 'package:codeblurb_mobile/network/models/code_quiz_solution_response.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drag_and_drop_provider.freezed.dart';
part 'drag_and_drop_provider.g.dart';

class DragProps {
  DragProps(this.answer, this.fromIndex);
  final String answer;
  final int fromIndex;
}

@freezed
class DragAndDropState with _$DragAndDropState {
  const factory DragAndDropState({
    required bool isLoading,
    required List<String> editedSolutions,
    required List<String> choicesOriginally,
    required List<String> remainingChoices,
    @Default(0) int shownHints,
    @Default(0) int tabControllerIndex,
    CodeQuizSolutionResponse? solution,
  }) = _DragAndDropState;
}

@riverpod
class DragAndDropNotifier extends _$DragAndDropNotifier {
  @override
  DragAndDropState build() {
    return const DragAndDropState(
      isLoading: false,
      editedSolutions: [],
      remainingChoices: [],
      choicesOriginally: [],
    );
  }

  void resetState({
    bool withoutPageReset = false,
  }) {
    state = DragAndDropState(
      isLoading: false,
      editedSolutions: List<String>.filled(state.choicesOriginally.length, ''),
      remainingChoices: List.from(state.choicesOriginally),
      choicesOriginally: List.from(state.choicesOriginally),
      tabControllerIndex: withoutPageReset ? state.tabControllerIndex : 0,
    );
  }

  void initChoices(List<String> choices) {
    state = state.copyWith(
      choicesOriginally: choices,
      remainingChoices: List<String>.from(choices),
      editedSolutions: List<String>.filled(choices.length, ''),
    );
  }

  void changeAnswerAtIndex({
    required int targetIndex,
    required String answer,
    required int fromIndex,
  }) {
    final newEditedSolutions = List<String>.from(state.editedSolutions);
    final hasAnswerAtSlot = state.editedSolutions[targetIndex].isNotEmpty;
    final wasAnswerUnused = fromIndex == -1;

    if (wasAnswerUnused) {
      newEditedSolutions[targetIndex] = answer;
    } else {
      final oldPosition = state.editedSolutions.indexOf(answer);
      newEditedSolutions[oldPosition] = '';
      newEditedSolutions[targetIndex] = answer;
    }

    if (wasAnswerUnused) {
      final newRemainingChoices = List<String>.from(state.remainingChoices)
        ..remove(answer);
      state = state.copyWith(
        solution: null,
        editedSolutions: newEditedSolutions,
        remainingChoices: [
          ...newRemainingChoices,
          if (hasAnswerAtSlot) state.editedSolutions[targetIndex],
        ],
      );
    } else {
      state = state.copyWith(
        solution: null,
        editedSolutions: newEditedSolutions,
        remainingChoices: [
          ...state.remainingChoices,
          if (hasAnswerAtSlot) state.editedSolutions[targetIndex],
        ],
      );
    }
  }

  void returnAnswerToChoices(DragProps props) {
    if (props.fromIndex == -1) {
      return; //answer is already in the remaining choices
    }
    final newEditedSolutions = List<String>.from(state.editedSolutions);
    newEditedSolutions[props.fromIndex] = '';

    state = state.copyWith(
      editedSolutions: newEditedSolutions,
      solution: null,
      remainingChoices: [
        ...state.remainingChoices,
        props.answer,
      ],
    );
  }

  Future<void> submitDragAndDropSolution({
    required int contentId,
    required int courseId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref
          .read(contentRepositoryProvider)
          .sendCodeQuizSolutionResultFor(
            contentId: contentId,
            solutions: state.editedSolutions,
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
