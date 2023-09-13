import 'package:codeblurb_mobile/core/app_constants.dart';
import 'package:codeblurb_mobile/core/core_providers.dart';
import 'package:codeblurb_mobile/data/auth/models/refresh_token_request.dart';
import 'package:codeblurb_mobile/data/auth/models/refresh_token_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_interceptor.dart';

final errorProvider = AutoDisposeNotifierProvider<ErrorNotifier, void>(
  ErrorNotifier.new,
);

class ErrorNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  void onError() {
    state = null;
  }

  @override
  bool updateShouldNotify(void previous, void next) => true;
}

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(baseUrl: AppConstants.baseUrl),
    )
      ..interceptors.addAll([
        if (!kReleaseMode) PrettyDioLogger(requestBody: true),
        AuthInterceptor(
          ref.watch(sharedPrefsProvider),
          onUnauthorized: ref.read(errorProvider.notifier).onError,
        ),
        QueuedInterceptorsWrapper(
          onError: (e, handler) {
            FirebaseCrashlytics.instance.recordError(e.error, e.stackTrace);
            return handler.reject(e);
          },
        ),
      ])
      ..transformer = BackgroundTransformer();
    return dio;
  },
  name: 'Dio',
);
