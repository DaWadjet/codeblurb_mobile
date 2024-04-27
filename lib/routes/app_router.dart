import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(
          page: ProfileRouter.page,
          children: [
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: ChangePasswordRoute.page),
          ],
        ),
        AutoRoute(
          page: HomeRouter.page,
          children: [
            AutoRoute(page: HomeRoute.page),
          ],
        ),
        AutoRoute(
          page: ShoppingCartRouter.page,
          children: [
            AutoRoute(page: ShoppingCartRoute.page),
          ],
        ),
        AutoRoute(
          page: MyCoursesRouter.page,
          children: [
            AutoRoute(page: MyCoursesRoute.page),
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
      ];
}
