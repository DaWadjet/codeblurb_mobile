import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_provider.g.dart';

@riverpod
class ChangePasswordNotifier extends _$ChangePasswordNotifier {
  @override
  AsyncValue<bool?> build() {
    return const AsyncData(null);
  }

  Future<void> changePassword({
    required String newPassword,
    required String oldPassword,
  }) async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepositoryProvider).changePassword(
            newPassword: newPassword,
            oldPassword: oldPassword,
          );
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Password changed successfully!');
      unawaited(ref.read(routerProvider).maybePop());
      state = const AsyncData(false);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
