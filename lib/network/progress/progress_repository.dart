import 'package:codeblurb_mobile/network/progress/progress_api.dart';

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
