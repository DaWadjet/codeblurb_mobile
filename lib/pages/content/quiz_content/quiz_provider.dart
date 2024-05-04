import 'dart:async';

import 'package:codeblurb_mobile/network/models/quiz_question_solution_request_item.dart';
import 'package:codeblurb_mobile/network/models/quiz_solution_response.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.g.dart';

@riverpod
class QuizContentNotifier extends _$QuizContentNotifier {
  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  Future<QuizSolutionResponse?> submitQuizSolution({
    required int courseId,
    required int contentId,
    required List<
            (
              int,
              int,
            )>
        answers,
  }) async {
    state = const AsyncData(true);
    try {
      final response = await ref
          .watch(
            contentRepositoryProvider,
          )
          .sendQuizSolution(
            contentId: contentId,
            answers: answers
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
      state = const AsyncValue.data(false);
      return response;
    } catch (e) {
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to submit quiz solution');
      state = const AsyncValue.data(false);
      return null;
    }
  }
}
