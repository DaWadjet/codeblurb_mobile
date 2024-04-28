// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class TabsPage extends HookWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MyCoursesRoute(),
        ShoppingCartRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Assets.images.home.svg(
                color: tabsRouter.activeIndex == 0
                    ? colors.primary
                    : colors.mutedForeground,
              ),
            ),
            BottomNavigationBarItem(
              label: 'My Courses',
              icon: Assets.images.myCourses.svg(
                color: tabsRouter.activeIndex == 1
                    ? colors.primary
                    : colors.mutedForeground,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Assets.images.shoppingCart.svg(
                color: tabsRouter.activeIndex == 2
                    ? colors.primary
                    : colors.mutedForeground,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Assets.images.user.svg(
                color: tabsRouter.activeIndex == 3
                    ? colors.primary
                    : colors.mutedForeground,
              ),
            ),
          ],
        );
      },
    );
  }
}
