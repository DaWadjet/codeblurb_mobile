import 'dart:async';

import 'package:codeblurb_mobile/network/firebase_api.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  AsyncValue<bool?> build() {
    return const AsyncData(null);
  }

  Future<void> logout() async {
    await FirebaseApi.deleteTokenFromFirestore(
      ref.read(isLoggedInProvider.notifier).getUsername(),
    );
    ref.read(isLoggedInProvider.notifier).setLoggedIn(value: false);
  }

  Future<void> forceLogout() async {
    await FirebaseApi.deleteAllTokensFromFirestore(
      ref.read(isLoggedInProvider.notifier).getUsername(),
    );
    ref
        .read(isLoggedInProvider.notifier)
        .setLoggedIn(value: false, force: true);
  }
}
