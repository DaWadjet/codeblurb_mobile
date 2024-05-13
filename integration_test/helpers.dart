import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpUntilFound on WidgetTester {
  Future<Finder> pumpUntilFound(
    Finder finder, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    final end = DateTime.now().add(timeout);

    do {
      if (DateTime.now().isAfter(end)) {
        throw Exception('Timed out waiting for $finder');
      }

      await pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 100), () {});
    } while (finder.evaluate().isEmpty);
    return finder;
  }

  Future<void> goBack() async {
    final navigator = state(find.byType(Navigator));
    await navigator.context.maybePop();
    await pump();
  }

  Future<void> login(String username) async {
    final usernameField =
        await pumpUntilFound(find.byKey(Keys.login_usernameField));
    final passwordField = find.byKey(Keys.login_passwordField);
    final submitButton = find.byKey(Keys.login_submit);

    await enterText(usernameField, username);
    await enterText(passwordField, 'testPassword');
    await tap(submitButton);
    await pumpUntilFound(find.byKey(Keys.tab_home));
  }
}
