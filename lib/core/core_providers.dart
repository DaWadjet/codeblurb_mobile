import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final remoteConfigProvider =
    Provider<FirebaseRemoteConfig>((_) => throw UnimplementedError());

final sharedPrefsProfider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());
