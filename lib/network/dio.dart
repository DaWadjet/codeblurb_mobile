import 'package:codeblurb_mobile/app_constants.dart';
import 'package:codeblurb_mobile/network/models/error_response.dart';
import 'package:codeblurb_mobile/network/models/login_response.dart';
import 'package:codeblurb_mobile/network/models/refresh_token_request.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_interceptor.dart';
part 'dio.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(baseUrl: AppConstants.baseUrl),
  )
    ..interceptors.addAll([
      if (!kReleaseMode) PrettyDioLogger(requestBody: true),
      AuthInterceptor(
        ref.watch(sharedPrefsProvider),
        onUnauthorized: ref.read(sessionErrorProvider.notifier).onError,
      ),
      QueuedInterceptorsWrapper(
        onError: (e, handler) {
          ref
              .read(toastNotifierProvider.notifier)
              .showToast((e.error! as ErrorResponse).errorMessage);
          FirebaseCrashlytics.instance.recordError(e.error, e.stackTrace);
          return handler.reject(e);
        },
      ),
    ])
    ..transformer = BackgroundTransformer();
  return dio;
}
