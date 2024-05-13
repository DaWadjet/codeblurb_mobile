import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Handling a background message ${message.messageId}');
}

void handleMessage(RemoteMessage? message) {
  log('Handling a message ${message?.messageId}');
}

void handleMessageOpenedApp(RemoteMessage? message) {
  log('Opened app from message ${message?.messageId}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
  );

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initLocalNotifications() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const initializationSettingsDarwin = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    unawaited(
      _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          final message = RemoteMessage.fromMap(
            (jsonDecode(details.payload ?? '')) as Map<String, dynamic>,
          );
          handleMessage(message);
        },
      ),
    );
    if (Platform.isIOS) return;
    final platform =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!;
    await platform.createNotificationChannel(_androidChannel);
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    unawaited(
      FirebaseMessaging.instance.getInitialMessage().then(handleMessage),
    );
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageOpenedApp);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      handleMessage(message);
      final notification = message.notification;
      if (notification != null) {
        final android = AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          importance: Importance.high,
        );
        final platform = NotificationDetails(
          android: android,
        );
        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          platform,
          payload: jsonEncode(message.toMap()),
        );
      }
    });
  }

  Future<void> initNotifications(String username) async {
    await _firebaseMessaging.requestPermission();
    unawaited(initPushNotifications());
    unawaited(initLocalNotifications());
    unawaited(saveTokenToFirestore(username));
  }

  Future<void> saveTokenToFirestore(String username) async {
    final token = await _firebaseMessaging.getToken();

    await FirebaseFirestore.instance.collection('tokens').doc(username).set({
      'fcmTokens': FieldValue.arrayUnion([token]),
    });
  }

  static Future<void> deleteTokenFromFirestore(String username) async {
    final token = await FirebaseMessaging.instance.getToken();
    //delete only this device's token
    await FirebaseFirestore.instance.collection('tokens').doc(username).update({
      'fcmTokens': FieldValue.arrayRemove([token]),
    });
  }

  static Future<void> deleteAllTokensFromFirestore(String username) async {
    await FirebaseFirestore.instance.collection('tokens').doc(username).update({
      'fcmTokens': [],
    });
  }
}
