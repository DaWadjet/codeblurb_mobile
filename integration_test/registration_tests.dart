import 'package:codeblurb_mobile/main.dart' as app;
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Registration', () {
    testWidgets('Registration validation fails because of empty password field',
        (tester) async {
      await app.main();
      final signupButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
      expect(signupButton, findsOneWidget);
      await tester.tap(signupButton);
      final button =
          await tester.pumpUntilFound(find.byKey(Keys.register_submit));
      final usernameField =
          await tester.pumpUntilFound(find.byKey(Keys.register_usernameField));
      final passwordField = await tester
          .pumpUntilFound(find.byKey(Keys.register_confirmPasswordField));

      await tester.enterText(usernameField, 'cypress');
      await tester.tap(button);
      await tester.pumpAndSettle();
      final errorText = find.text('This field is required');
      expect(errorText, findsAtLeast(1));
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
      'Registration validation fails because of empty username field',
      (tester) async {
        await app.main();
        final signupButton =
            await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
        expect(signupButton, findsOneWidget);
        await tester.tap(signupButton);
        final button =
            await tester.pumpUntilFound(find.byKey(Keys.register_submit));
        final usernameField = await tester
            .pumpUntilFound(find.byKey(Keys.register_usernameField));
        final passwordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_passwordField));

        await tester.enterText(passwordField, 'testPassword');
        await tester.tap(button);
        await tester.pumpAndSettle();
        final errorText = find.text('This field is required');
        expect(errorText, findsAtLeast(1));
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
      'Registration validation fails due to password not long enough',
      (tester) async {
        await app.main();
        final signupButton =
            await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
        expect(signupButton, findsOneWidget);
        await tester.tap(signupButton);
        final button =
            await tester.pumpUntilFound(find.byKey(Keys.register_submit));
        final usernameField = await tester
            .pumpUntilFound(find.byKey(Keys.register_usernameField));
        final passwordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_passwordField));
        final confirmPasswordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_confirmPasswordField));

        await tester.enterText(usernameField, 'cypress');
        await tester.enterText(passwordField, 'test');
        await tester.enterText(confirmPasswordField, 'test');
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: passwordField,
            matching: find.text(
              'Password must be at least 8 characters',
            ),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Registration validation fails due to passwords not matching',
      (tester) async {
        await app.main();
        final signupButton =
            await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
        expect(signupButton, findsOneWidget);
        await tester.tap(signupButton);
        final button =
            await tester.pumpUntilFound(find.byKey(Keys.register_submit));
        final usernameField = await tester
            .pumpUntilFound(find.byKey(Keys.register_usernameField));
        final passwordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_passwordField));
        final confirmPasswordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_confirmPasswordField));

        await tester.enterText(usernameField, 'cypress');
        await tester.enterText(passwordField, 'testPassword');
        await tester.enterText(confirmPasswordField, 'testPassword1');
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: confirmPasswordField,
            matching: find.text(
              'Passwords must match',
            ),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets('Invalid email was provided', (tester) async {
      await app.main();
      final signupButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
      expect(signupButton, findsOneWidget);
      await tester.tap(signupButton);
      final button =
          await tester.pumpUntilFound(find.byKey(Keys.register_submit));
      final emailField =
          await tester.pumpUntilFound(find.byKey(Keys.register_emailField));
      final usernameField =
          await tester.pumpUntilFound(find.byKey(Keys.register_usernameField));
      final passwordField =
          await tester.pumpUntilFound(find.byKey(Keys.register_passwordField));
      final confirmPasswordField = await tester
          .pumpUntilFound(find.byKey(Keys.register_confirmPasswordField));

      await tester.enterText(emailField, 'cypress');
      await tester.enterText(usernameField, 'cypress');
      await tester.enterText(passwordField, 'testPassword');
      await tester.enterText(confirmPasswordField, 'testPassword');
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: emailField,
          matching: find.text(
            'Invalid email address',
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      'Unsuccessful registration due to username already in use',
      (tester) async {
        await app.main();
        final signupButton =
            await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
        expect(signupButton, findsOneWidget);
        await tester.tap(signupButton);
        final button =
            await tester.pumpUntilFound(find.byKey(Keys.register_submit));
        final usernameField = await tester
            .pumpUntilFound(find.byKey(Keys.register_usernameField));
        final passwordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_passwordField));
        final confirmPasswordField = await tester
            .pumpUntilFound(find.byKey(Keys.register_confirmPasswordField));
        final emailField =
            await tester.pumpUntilFound(find.byKey(Keys.register_emailField));
        await tester.enterText(usernameField, 'cypress');
        await tester.enterText(passwordField, 'testPassword');
        await tester.enterText(confirmPasswordField, 'testPassword');
        await tester.enterText(emailField, 'celevicte@gmail.com');
        await tester.tap(button);
        final toast = await tester.pumpUntilFound(find.byKey(Keys.toast));
        expect(toast, findsOneWidget);
        expect(usernameField, findsOneWidget);
      },
    );

    testWidgets('Successful registration', (tester) async {
      await app.main();
      final signupButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
      expect(signupButton, findsOneWidget);
      await tester.tap(signupButton);
      final button =
          await tester.pumpUntilFound(find.byKey(Keys.register_submit));
      final usernameField =
          await tester.pumpUntilFound(find.byKey(Keys.register_usernameField));
      final passwordField =
          await tester.pumpUntilFound(find.byKey(Keys.register_passwordField));
      final confirmPasswordField = await tester
          .pumpUntilFound(find.byKey(Keys.register_confirmPasswordField));

      final emailField =
          await tester.pumpUntilFound(find.byKey(Keys.register_emailField));
      await tester.enterText(
        usernameField,
        'e2etest${DateTime.now().millisecondsSinceEpoch}',
      );
      await tester.enterText(passwordField, 'testPassword');
      await tester.enterText(confirmPasswordField, 'testPassword');
      await tester.enterText(
        emailField,
        'e2etest${DateTime.now().millisecondsSinceEpoch}@test.com',
      );
      await tester.tap(button);
      final homeButton = await tester.pumpUntilFound(find.byKey(Keys.tab_home));
      expect(homeButton, findsOneWidget);
    });
  });
}
