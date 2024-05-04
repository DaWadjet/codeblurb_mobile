import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<bool?> build() {
    return const AsyncData(null);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      await ref
          .read(authRepositoryProvider)
          .login(username: username, password: password);
      ref.read(isLoggedInProvider.notifier).setLoggedIn(value: true);
      unawaited(ref.read(routerProvider).replaceAll([const LoggedInRoute()]));
    } finally {
      state = const AsyncData(null);
    }
  }
}
