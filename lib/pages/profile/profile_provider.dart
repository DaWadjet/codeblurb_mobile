import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  AsyncValue<bool?> build() {
    return const AsyncData(null);
  }

  Future<void> logout() async {
    try {
      unawaited(ref.read(authRepositoryProvider).logout());
    } finally {
      unawaited(ref.read(routerProvider).push(const LoginRoute()));
    }
  }

  Future<void> forceLogout() async {
    try {
      unawaited(ref.read(authRepositoryProvider).forceLogout());
    } finally {
      unawaited(ref.read(routerProvider).push(const LoginRoute()));
    }
  }
}
