// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TabsPage extends HookConsumerWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingCartQuery = ref.watch(shoppingCartQueryProvider);
    final colors = useColors();
    final bottomNavbarColors = Theme.of(context).bottomNavigationBarTheme;
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MyCoursesRoute(),
        ShoppingCartRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: colors.border,
                width: 1.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Assets.images.home.svg(
                    color: tabsRouter.activeIndex == 0
                        ? bottomNavbarColors.selectedIconTheme?.color
                        : bottomNavbarColors.unselectedIconTheme?.color,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'My Courses',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Assets.images.myCourses.svg(
                    color: tabsRouter.activeIndex == 1
                        ? bottomNavbarColors.selectedIconTheme?.color
                        : bottomNavbarColors.unselectedIconTheme?.color,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Assets.images.shoppingCart.svg(
                        color: tabsRouter.activeIndex == 2
                            ? bottomNavbarColors.selectedIconTheme?.color
                            : bottomNavbarColors.unselectedIconTheme?.color,
                      ),
                    ),
                    shoppingCartQuery.whenOrNull(
                          data: (data) {
                            if (data.shoppingItems.isEmpty) {
                              return const SizedBox();
                            }
                            return Positioned(
                              right: -8,
                              top: -4,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: tabsRouter.activeIndex == 2
                                      ? bottomNavbarColors
                                          .selectedIconTheme?.color
                                      : bottomNavbarColors
                                          .unselectedIconTheme?.color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 16,
                                width: 16,
                                child: Text(
                                  data.shoppingItems.length > 9
                                      ? '9+'
                                      : data.shoppingItems.length.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    height: 1.25,
                                    fontWeight: FontWeight.bold,
                                    color: colors.background,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ).animate().fadeIn(),
                            );
                          },
                        ) ??
                        const SizedBox(),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Assets.images.user.svg(
                    color: tabsRouter.activeIndex == 3
                        ? bottomNavbarColors.selectedIconTheme?.color
                        : bottomNavbarColors.unselectedIconTheme?.color,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
