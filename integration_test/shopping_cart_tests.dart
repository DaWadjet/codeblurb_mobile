import 'package:codeblurb_mobile/main.dart' as app;
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Adding and removing items from and to cart', (tester) async {
    await app.main();
    await tester.login('cypress');
    final addToCartButtons =
        await tester.pumpUntilFound(find.byKey(Keys.cartAdd));
    expect(
      addToCartButtons,
      findsAtLeast(1),
    );
    expect(find.byKey(Keys.cartItemsCountBadge), findsNothing);

    await tester.tap(addToCartButtons.first);
    final viewCartCta = await tester.pumpUntilFound(find.byKey(Keys.cartCta));
    expect(viewCartCta, findsOneWidget);
    expect(find.byKey(Keys.cartItemsCountBadge), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(Keys.cartItemsCountBadge),
        matching: find.text('1'),
      ),
      findsOneWidget,
    );
    final viewCartButton = find.byKey(Keys.viewCart);

    await tester.tap(viewCartButton);
    final checkoutButton =
        await tester.pumpUntilFound(find.byKey(Keys.cartCheckout));
    final removeButtons =
        await tester.pumpUntilFound(find.byKey(Keys.cartRemove));
    expect(removeButtons, findsAtLeast(1));
    expect(
      find.descendant(
        of: find.byKey(Keys.cartItemsCountBadge),
        matching: find.text(removeButtons.evaluate().length.toString()),
      ),
      findsOneWidget,
    );

    await tester.tap(removeButtons.first);
    final dialogConfirmButton =
        await tester.pumpUntilFound(find.byKey(Keys.areYouSure_confirm));
    await tester.tap(dialogConfirmButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    expect(find.byKey(Keys.cartItemsCountBadge), findsNothing);
    expect(checkoutButton, findsNothing);

    await tester.tap(find.byKey(Keys.tab_profile));
    final logoutButton =
        await tester.pumpUntilFound(find.byKey(Keys.profile_logout));
    await tester.tap(logoutButton);
    await tester.pumpUntilFound(find.byKey(Keys.login_submit));
  });
}
