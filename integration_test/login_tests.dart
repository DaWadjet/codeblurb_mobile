import 'package:codeblurb_mobile/main.dart' as app;
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Forgot Password Flow', () {
    testWidgets('Successful password reset request', (tester) async {
      await app.main();

      final requestPasswordResetButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_forgotPassword));
      await tester.tap(requestPasswordResetButton);
      final emailField =
          await tester.pumpUntilFound(find.byKey(Keys.requestPassword_input));
      await tester.enterText(emailField, 'ilyenbiztostannemletezik');
      final submitButton =
          await tester.pumpUntilFound(find.byKey(Keys.requestPassword_submit));

      await tester.tap(submitButton);
      await tester.pumpUntilFound(find.byKey(Keys.toast));
    });
    testWidgets('Successful password reset request', (tester) async {
      await app.main();

      final requestPasswordResetButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_forgotPassword));
      await tester.tap(requestPasswordResetButton);
      final emailField =
          await tester.pumpUntilFound(find.byKey(Keys.requestPassword_input));
      final submitButton =
          await tester.pumpUntilFound(find.byKey(Keys.requestPassword_submit));

      await tester.tap(submitButton);

      await tester.pumpUntilFound(
        find.descendant(
          of: emailField,
          matching: find.text('This field is required'),
        ),
      );
    });
  });

  group('Login', () {
    testWidgets('Login validation fails because of empty password field',
        (tester) async {
      await app.main();

      final button = await tester.pumpUntilFound(find.byKey(Keys.login_submit));
      final usernameField =
          await tester.pumpUntilFound(find.byKey(Keys.login_usernameField));
      final passwordField =
          await tester.pumpUntilFound(find.byKey(Keys.login_passwordField));

      await tester.enterText(usernameField, 'cypress');
      await tester.tap(button);
      await tester.pumpAndSettle();
      final errorText = find.text('This field is required');
      expect(errorText, findsOneWidget);
      expect(
        find.descendant(
          of: passwordField,
          matching: find.text(
            'This field is required',
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      'Login validation fails because of empty username field',
      (tester) async {
        await app.main();

        final button =
            await tester.pumpUntilFound(find.byKey(Keys.login_submit));
        final usernameField =
            await tester.pumpUntilFound(find.byKey(Keys.login_usernameField));
        final passwordField =
            await tester.pumpUntilFound(find.byKey(Keys.login_passwordField));

        await tester.enterText(passwordField, 'testPassword');
        await tester.tap(button);
        await tester.pumpAndSettle();
        final errorText = find.text('This field is required');
        expect(errorText, findsOneWidget);
        expect(
          find.descendant(
            of: usernameField,
            matching: find.text(
              'This field is required',
            ),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Successful login',
      (tester) async {
        await app.main();

        await tester.login('cypress');
      },
    );
    testWidgets('Successfully log in if already have refresh token',
        (tester) async {
      await app.main();
      await tester.pumpUntilFound(find.byKey(Keys.tab_home));
    });

    testWidgets('Successful logout', (tester) async {
      await app.main();
      await tester.pumpUntilFound(find.byKey(Keys.tab_profile));

      await tester.tap(find.byKey(Keys.tab_profile));
      final logoutButton =
          await tester.pumpUntilFound(find.byKey(Keys.profile_logout));
      await tester.tap(logoutButton);
      await tester.pumpUntilFound(find.byKey(Keys.login_submit));
    });
  });
}
