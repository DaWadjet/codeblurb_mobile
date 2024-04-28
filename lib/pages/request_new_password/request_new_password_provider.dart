import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'request_new_password_provider.g.dart';

@riverpod
class RequestNewPasswordNotifier extends _$RequestNewPasswordNotifier {
  @override
  AsyncValue<bool?> build() {
    return const AsyncData(null);
  }

  Future<void> requestPasswordResetEmail({
    required String username,
  }) async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepositoryProvider).forgotPassword(username: username);
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Password reset email sent!');
      state = const AsyncData(true);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
