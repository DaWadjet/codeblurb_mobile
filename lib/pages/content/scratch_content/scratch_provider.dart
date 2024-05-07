import 'dart:async';

import 'package:codeblurb_mobile/network/models/code_solution_response.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scratch_provider.freezed.dart';
part 'scratch_provider.g.dart';

@freezed
class ScratchState with _$ScratchState {
  const factory ScratchState({
    required bool isLoading,
    required String code,
    @Default(0) int shownHints,
    @Default(0) int tabControllerIndex,
    CodeSolutionResponse? solution,
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

  Future<void> submitScratchSolution({
    required int contentId,
    required int courseId,
  }) async {
    state =
        state.copyWith(isLoading: true, solution: null, tabControllerIndex: 2);
    try {
      final response =
          await ref.read(contentRepositoryProvider).sendCodeSolution(
                contentId: contentId,
                code: state.code.replaceAll(
                  //replace the incorrect quote
                  RegExp('“|”'),
                  '"',
                ),
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

  void setCode(String code) {
    state = state.copyWith(
      code: code.replaceAll(
        //replace the incorrect quote
        RegExp('“|”'),

        '"',
      ),
    );
  }

  void showHint() {
    state = state.copyWith(
      shownHints: state.shownHints + 1,
      tabControllerIndex: 0,
    );
  }

  void insertCurlyBraces(TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: '{}',
        controller: controller,
      );
  void insertParentheses(TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: '()',
        controller: controller,
      );

  void insertQuotes(TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: '""',
        controller: controller,
      );

  void insertCode(String code, TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: code,
        controller: controller,
      );

  void insertSquareBrackets(TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: '[]',
        controller: controller,
      );

  void insertTab(TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: '\t',
        controller: controller,
      );

  void insertEqualSign(TextEditingController controller) =>
      _insertCodeToCurrentPosition(
        code: ' = ',
        cursorOffsetFromInsertionPoint: 3,
        controller: controller,
      );

  void _insertCodeToCurrentPosition({
    required String code,
    required TextEditingController controller,
    int cursorOffsetFromInsertionPoint = 1,
  }) {
    final cursorPosition = controller.selection.extent;
    final currentCode = controller.text;

    final newCode = currentCode.replaceRange(
      cursorPosition.offset,
      cursorPosition.offset,
      code,
    );
    controller
      ..text = newCode
      ..selection = TextSelection.collapsed(
        offset: cursorPosition.offset + cursorOffsetFromInsertionPoint,
      );

    state = state.copyWith(code: controller.text);
  }
}
