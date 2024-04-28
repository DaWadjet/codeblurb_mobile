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

  Future<void> login() async {
    state = const AsyncLoading();
    try {
      await ref
          .read(authRepositoryProvider)
          .login(username: 'testUser', password: 'testPassword');
      unawaited(ref.read(routerProvider).push(const TabsRoute()));
      state = const AsyncData(false);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
