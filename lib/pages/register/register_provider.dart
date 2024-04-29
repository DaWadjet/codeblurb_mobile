import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  AsyncValue<bool?> build() {
    return const AsyncData(null);
  }

  Future<void> register({
    required String email,
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepositoryProvider).register(
            username: username,
            password: password,
            email: email,
          );
      ref.read(isLoggedInProvider.notifier).setLoggedIn(value: true);
      unawaited(ref.read(routerProvider).replaceAll([const LoggedInRoute()]));

      state = const AsyncData(false);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
