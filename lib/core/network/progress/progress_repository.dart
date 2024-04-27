import 'package:codeblurb_mobile/core/network/Progress/Progress_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressRepoProvider = Provider<ProgressRepository>(
  (ref) => ProgressRepository(ref.watch(progressApiProvider)),
  name: 'Progress Repository Provider',
);

class ProgressRepository {
  ProgressRepository(this._progressApi);
  final ProgressApi _progressApi;

  Future<void> markAsSeen(int contentId) async {
    await _progressApi.markAsSeen(contentId);
  }

  Future<void> markAsCompleted(int contentId) async {
    await _progressApi.markAsCompleted(contentId);
  }
}
