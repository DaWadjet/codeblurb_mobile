import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MyCoursesRoute(),
        ShoppingCartRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blue,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.people)),
            BottomNavigationBarItem(
              label: 'My Courses',
              icon: Icon(Icons.post_add),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.settings),
            ),
          ],
        );
      },
    );
  }
}
