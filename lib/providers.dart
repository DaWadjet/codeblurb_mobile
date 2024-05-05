import 'dart:async';

import 'package:codeblurb_mobile/app_constants.dart';
import 'package:codeblurb_mobile/network/auth/auth_api.dart';
import 'package:codeblurb_mobile/network/auth/auth_repository.dart';
import 'package:codeblurb_mobile/network/auth/utils.dart';
import 'package:codeblurb_mobile/network/content/content_api.dart';
import 'package:codeblurb_mobile/network/content/content_repository.dart';
import 'package:codeblurb_mobile/network/dio.dart';
import 'package:codeblurb_mobile/network/models/page_minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/network/models/page_shopping_item_response.dart';
import 'package:codeblurb_mobile/network/models/previous_payments_response.dart';
import 'package:codeblurb_mobile/network/models/profile_response.dart';
import 'package:codeblurb_mobile/network/models/separated_content_bundle_response.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
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
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';
import 'package:codeblurb_mobile/utils/sort_by.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

void loggedInGuard(Ref ref) {
  if (!ref.watch(isLoggedInProvider)) {
    throw Exception('Only usable when logged in!');
  }
}

@Riverpod(keepAlive: true)
FirebaseRemoteConfig remoteConfig(RemoteConfigRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
class SessionError extends _$SessionError {
  @override
  bool build() {
    return false;
  }

  void clearError() {
    state = false;
  }

  void onError() {
    state = true;
  }
}

@Riverpod(keepAlive: true)
class ToastNotifier extends _$ToastNotifier {
  @override
  String build() {
    return '';
  }

  // ignore: use_setters_to_change_properties
  void showToast(String message) {
    state = message;
  }

  @override
  bool updateShouldNotify(void previous, void next) => true;
}

@Riverpod(keepAlive: true)
class AlertDialogNotifier extends _$AlertDialogNotifier {
  @override
  AlertDialogProps build() {
    return const AlertDialogProps(
      title: '',
      message: '',
      onConfirm: null,
    );
  }

  // ignore: use_setters_to_change_properties
  void showAreYouSureDialog({
    required String title,
    required String message,
    VoidCallback? onConfirm,
  }) {
    state = AlertDialogProps(
      title: title,
      message: message,
      onConfirm: onConfirm,
    );
  }

  @override
  bool updateShouldNotify(void previous, void next) => true;
}

class AlertDialogProps {
  const AlertDialogProps({
    required this.title,
    required this.message,
    required this.onConfirm,
  });

  final String title;
  final String message;
  final VoidCallback? onConfirm;
}

@Riverpod(keepAlive: true)
ShoppingApi shoppingApi(ShoppingApiRef ref) =>
    ShoppingApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
ShoppingRepository shoppingRepository(ShoppingRepositoryRef ref) =>
    ShoppingRepository(ref.watch(shoppingApiProvider));

@Riverpod(keepAlive: true)
ContentApi contentApi(ContentApiRef ref) => ContentApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
ContentRepository contentRepository(ContentRepositoryRef ref) =>
    ContentRepository(ref.watch(contentApiProvider));

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

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
AppRouter router(RouterRef ref) => AppRouter();

@riverpod
Future<bool> refreshToken(RefreshTokenRef ref) async {
  final isSuccess = await ref
      .watch(
        authRepositoryProvider,
      )
      .refreshToken();
  if (isSuccess) {
    ref.read(isLoggedInProvider.notifier).setLoggedIn(value: true);
  }
  return isSuccess;
}

@riverpod
Future<PreviousPaymentsResponse> paymentsQuery(PaymentsQueryRef ref) {
  loggedInGuard(ref);
  return ref
      .watch(
        paymentRepositoryProvider,
      )
      .getPayments();
}

@riverpod
Future<ProfileResponse> profileQuery(ProfileQueryRef ref) {
  loggedInGuard(ref);
  ref.cacheFor(const Duration(minutes: 1));

  return ref.watch(profileRepositoryProvider).getProfile();
}

@riverpod
Future<PagedShoppingItemsResponse> availableShoppingItemsQuery(
  AvailableShoppingItemsQueryRef ref, {
  PageProps? pageProps,
}) {
  loggedInGuard(ref);
  ref.cacheFor(const Duration(minutes: 1));

  return ref
      .watch(
        shoppingRepositoryProvider,
      )
      .getAvailableShoppingItems(pageProps ?? SortBy.none());
}

@riverpod
Future<SeparatedContentBundleResponse> contentBundleQuery(
  ContentBundleQueryRef ref,
  int contentId,
) {
  loggedInGuard(ref);
  ref.cacheFor(const Duration(minutes: 1));

  return ref
      .watch(
        contentRepositoryProvider,
      )
      .getContentBundle(contentId);
}

@riverpod
Future<ShoppingItemResponse> shoppingItemDetailsQuery(
  ShoppingItemDetailsQueryRef ref,
  int id,
) {
  loggedInGuard(ref);
  ref.cacheFor(const Duration(minutes: 1));

  return ref
      .watch(
        shoppingRepositoryProvider,
      )
      .getShoppingItem(id);
}

@riverpod
Future<PagedMinimalContentBundleResponse> contentBundlesQuery(
  ContentBundlesQueryRef ref, {
  PageProps? pageProps,
}) {
  loggedInGuard(ref);
  ref.cacheFor(const Duration(minutes: 1));
  return ref
      .watch(
        contentRepositoryProvider,
      )
      .getContentBundles(pageProps ?? SortBy.none());
}

@Riverpod(keepAlive: true)
class IsLoggedIn extends _$IsLoggedIn {
  @override
  bool build() => false;

  String getUsername() {
    final token =
        ref.read(sharedPrefsProvider).getString(AppConstants.accessToken);
    if (token == null) {
      throw Exception('Token not found');
    }
    final decodedToken = decode(token: token);

    return decodedToken.customerName;
  }

  void setLoggedIn({required bool value, bool force = false}) {
    if (value) {
      state = true;
    } else {
      if (force) {
        ref.read(authRepositoryProvider).forceLogout();
      } else {
        ref.read(authRepositoryProvider).logout();
      }
      unawaited(
        ref.read(routerProvider).replaceAll([LoginRoute()]),
      );
      ref.invalidateSelf();
    }
  }

  @override
  bool updateShouldNotify(bool previous, bool next) => true;
}

extension on AutoDisposeRef<Object?> {
  void cacheFor(Duration duration) {
    final keepAliveLink = keepAlive();
    Timer(
      duration,
      keepAliveLink.close,
    );
  }
}
