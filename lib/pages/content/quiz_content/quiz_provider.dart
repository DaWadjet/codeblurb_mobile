import 'dart:async';

import 'package:codeblurb_mobile/network/models/quiz_question_solution_request_item.dart';
import 'package:codeblurb_mobile/network/models/quiz_solution_response.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.freezed.dart';
part 'quiz_provider.g.dart';

@freezed
class QuizContentState with _$QuizContentState {
  const factory QuizContentState({
    required bool isLoading,
    required List<(int, int)> answers,
    required int shownQuestionIndex,
    QuizSolutionResponse? solution,
  }) = _QuizContentState;
}

@riverpod
class QuizContentNotifier extends _$QuizContentNotifier {
  @override
  QuizContentState build() {
    return const QuizContentState(
      isLoading: false,
      answers: [],
      shownQuestionIndex: -1,
    );
  }

  void showNextQuestion() {
    state = state.copyWith(
      shownQuestionIndex: state.shownQuestionIndex + 1,
    );
  }

  void showPreviousQuestion() {
    state = state.copyWith(
      shownQuestionIndex: state.shownQuestionIndex - 1,
    );
  }

  void resetState() {
    state = state.copyWith(
      isLoading: false,
      answers: [],
      shownQuestionIndex: -1,
    );
  }

  void answerQuestion(int questionId, int answerId) {
    final answers = state.answers;
    final index = answers.indexWhere((element) => element.$1 == questionId);
    if (index == -1) {
      state = state.copyWith(
        shownQuestionIndex: state.shownQuestionIndex + 1,
        answers: [...answers, (questionId, answerId)],
      );
    } else {
      state = state.copyWith(
        shownQuestionIndex: state.shownQuestionIndex + 1,
        answers: [
          ...answers.sublist(0, index),
          (questionId, answerId),
          ...answers.sublist(index + 1),
        ],
      );
    }
  }

  Future<bool> submitQuizSolution({
    required int courseId,
    required int contentId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref
          .watch(
            contentRepositoryProvider,
          )
          .sendQuizSolution(
            contentId: contentId,
            answers: state.answers
                .map(
                  (e) => QuizQestionSolutionRequestItem(
                    e.$1,
                    e.$2,
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
      return true;
    } catch (e) {
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to submit quiz solution');
      state = state.copyWith(isLoading: false);
      return false;
    }
  }
}
