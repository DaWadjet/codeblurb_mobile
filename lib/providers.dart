import 'package:codeblurb_mobile/network/auth/auth_api.dart';
import 'package:codeblurb_mobile/network/auth/auth_repository.dart';
import 'package:codeblurb_mobile/network/dio.dart';
import 'package:codeblurb_mobile/network/payment/payment_api.dart';
import 'package:codeblurb_mobile/network/payment/payment_repository.dart';
import 'package:codeblurb_mobile/network/profile/profile_api.dart';
import 'package:codeblurb_mobile/network/profile/profile_repository.dart';
import 'package:codeblurb_mobile/network/progress/progress_api.dart';
import 'package:codeblurb_mobile/network/progress/progress_repository.dart';
import 'package:codeblurb_mobile/network/ratings/ratings_api.dart';
import 'package:codeblurb_mobile/network/ratings/ratings_repository.dart';
import 'package:codeblurb_mobile/network/shopping/shopping_api.dart';
import 'package:codeblurb_mobile/network/shopping/shopping_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generated/providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseRemoteConfig remoteConfig(RemoteConfigRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
class Error extends _$Error {
  @override
  void build() {}

  void onError() {
    state = null;
  }

  @override
  bool updateShouldNotify(void previous, void next) => true;
}

@Riverpod(keepAlive: true)
ShoppingApi shoppingApi(ShoppingApiRef ref) =>
    ShoppingApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
ShoppingRepository shoppingRepository(ShoppingRepositoryRef ref) =>
    ShoppingRepository(ref.watch(shoppingApiProvider));

@Riverpod(keepAlive: true)
AuthApi authApi(AuthApiRef ref) => AuthApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(ref.watch(authApiProvider), ref.watch(sharedPrefsProvider));

@Riverpod(keepAlive: true)
PaymentApi paymentApi(PaymentApiRef ref) => PaymentApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(PaymentRepositoryRef ref) =>
    PaymentRepository(ref.watch(paymentApiProvider));

@Riverpod(keepAlive: true)
ProfileApi profileApi(ProfileApiRef ref) => ProfileApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) =>
    ProfileRepository(ref.watch(profileApiProvider));

@Riverpod(keepAlive: true)
ProgressApi progressApi(ProgressApiRef ref) =>
    ProgressApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
ProgressRepository progressRepository(ProgressRepositoryRef ref) =>
    ProgressRepository(
      ref.watch(progressApiProvider),
    );

@Riverpod(keepAlive: true)
RatingsApi ratingsApi(RatingsApiRef ref) => RatingsApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
RatingsRepository ratingsRepository(RatingsRepositoryRef ref) =>
    RatingsRepository(ref.watch(ratingsApiProvider));
