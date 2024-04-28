import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/article_content_page.dart';
import 'package:codeblurb_mobile/pages/change_password/change_password_page.dart';
import 'package:codeblurb_mobile/pages/course_details_page.dart';
import 'package:codeblurb_mobile/pages/course_ratings_page.dart';
import 'package:codeblurb_mobile/pages/drag_and_drop_content_page.dart';
import 'package:codeblurb_mobile/pages/explore_page.dart';
import 'package:codeblurb_mobile/pages/fill_the_gaps_content_page.dart';
import 'package:codeblurb_mobile/pages/home_page.dart';
import 'package:codeblurb_mobile/pages/login/login_page.dart';
import 'package:codeblurb_mobile/pages/my_courses_page.dart';
import 'package:codeblurb_mobile/pages/profile/profile_page.dart';
import 'package:codeblurb_mobile/pages/purchased_course_details_page.dart';
import 'package:codeblurb_mobile/pages/quiz_content_page.dart';
import 'package:codeblurb_mobile/pages/quiz_content_results_page.dart';
import 'package:codeblurb_mobile/pages/register/register_page.dart';
import 'package:codeblurb_mobile/pages/request_new_password/request_new_password_page.dart';
import 'package:codeblurb_mobile/pages/scratch_content_page.dart';
import 'package:codeblurb_mobile/pages/shopping_cart_page.dart';
import 'package:codeblurb_mobile/pages/splash_page.dart';
import 'package:codeblurb_mobile/pages/tabs_page.dart';
import 'package:codeblurb_mobile/pages/video_content_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(
          page: TabsRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ShoppingCartRoute.page),
            AutoRoute(page: MyCoursesRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: ExploreRoute.page),
        AutoRoute(page: CourseDetailsRoute.page),
        AutoRoute(page: PurchasedCourseDetailsRoute.page),
        AutoRoute(page: CourseRatingsRoute.page),
        AutoRoute(page: VideoContentRoute.page),
        AutoRoute(page: QuizContentRoute.page),
        AutoRoute(page: QuizContentResultsRoute.page),
        AutoRoute(page: ScratchContentRoute.page),
        AutoRoute(page: FillTheGapsContentRoute.page),
        AutoRoute(page: DragAndDropContentRoute.page),
        AutoRoute(page: ArticleContentRoute.page),
        AutoRoute(page: RequestNewPasswordRoute.page),
      ];
}
