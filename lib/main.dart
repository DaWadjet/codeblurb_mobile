import 'package:codeblurb_mobile/codeblurb_app.dart';
import 'package:codeblurb_mobile/firebase_options.dart';
import 'package:codeblurb_mobile/l10n/localization_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/utils/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    EasyLocalization.ensureInitialized(),
    _initFirebase(DefaultFirebaseOptions.currentPlatform),
  ]);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  final remoteConfig = FirebaseRemoteConfig.instance;
  runApp(
    ProviderScope(
      overrides: [
        remoteConfigProvider.overrideWithValue(remoteConfig),
        sharedPrefsProvider.overrideWithValue(sharedPrefs),
      ],
      observers: const [if (!kReleaseMode) Logger()],
      child: const LocalizationProviderWidget(
        child: CodeblurbApp(),
      ),
    ),
  );
}

Future<void> _initFirebase(FirebaseOptions options) async {
  await Firebase.initializeApp(options: options);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 2),
    ),
  );
  await remoteConfig.setDefaults({});
}
