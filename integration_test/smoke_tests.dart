import 'package:codeblurb_mobile/main.dart' as app;
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //for some reason this did not end up working as expected
  // setUp(
  //   app.main,
  // );
  group('Basic Navigation', () {
    testWidgets('App starts', (tester) async {
      await app.main();

      final button = await tester.pumpUntilFound(find.byKey(Keys.login_submit));
      expect(button, findsOneWidget);
    });
    testWidgets('Certain pages can be visited whilst logged out',
        (tester) async {
      await app.main();

      final signupButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_signUp));
      expect(signupButton, findsOneWidget);

      await tester.tap(signupButton);
      final registerButton =
          await tester.pumpUntilFound(find.byKey(Keys.register_submit));
      expect(registerButton, findsOneWidget);

      await tester.goBack();
      final requestPasswordResetButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_forgotPassword));
      expect(requestPasswordResetButton, findsOneWidget);
      await tester.goBack();
      final loginButton =
          await tester.pumpUntilFound(find.byKey(Keys.login_submit));
      expect(loginButton, findsOneWidget);
    });
  });
}
