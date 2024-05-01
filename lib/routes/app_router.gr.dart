// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArticleContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticleContentPage(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChangePasswordPage(key: args.key),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseDetailsPage(
          courseId: args.courseId,
          key: args.key,
        ),
      );
    },
    CourseRatingsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseRatingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseRatingsPage(
          courseId: args.courseId,
          key: args.key,
        ),
      );
    },
    DragAndDropContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DragAndDropContentPage(),
      );
    },
    ExploreRoute.name: (routeData) {
      final args = routeData.argsAs<ExploreRouteArgs>(
          orElse: () => const ExploreRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExplorePage(
          key: args.key,
          filterProps: args.filterProps,
        ),
      );
    },
    FillTheGapsContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FillTheGapsContentPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoggedInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoggedInPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    MyCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCoursesPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    PurchasedCourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PurchasedCourseDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PurchasedCourseDetailsPage(
          courseId: args.courseId,
          key: args.key,
        ),
      );
    },
    PurchasedCourseRatingsRoute.name: (routeData) {
      final args = routeData.argsAs<PurchasedCourseRatingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PurchasedCourseRatingsPage(
          courseId: args.courseId,
          key: args.key,
        ),
      );
    },
    QuizContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizContentPage(),
      );
    },
    QuizContentResultsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizContentResultsPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPage(key: args.key),
      );
    },
    RequestNewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<RequestNewPasswordRouteArgs>(
          orElse: () => const RequestNewPasswordRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RequestNewPasswordPage(key: args.key),
      );
    },
    ScratchContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScratchContentPage(),
      );
    },
    ShoppingCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShoppingCartPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    TabsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabsPage(),
      );
    },
    VideoContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VideoContentPage(),
      );
    },
  };
}

/// generated route for
/// [ArticleContentPage]
class ArticleContentRoute extends PageRouteInfo<void> {
  const ArticleContentRoute({List<PageRouteInfo>? children})
      : super(
          ArticleContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleContentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<ChangePasswordRouteArgs> page =
      PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CourseDetailsPage]
class CourseDetailsRoute extends PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    required int courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CourseDetailsRoute.name,
          args: CourseDetailsRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static const PageInfo<CourseDetailsRouteArgs> page =
      PageInfo<CourseDetailsRouteArgs>(name);
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    required this.courseId,
    this.key,
  });

  final int courseId;

  final Key? key;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [CourseRatingsPage]
class CourseRatingsRoute extends PageRouteInfo<CourseRatingsRouteArgs> {
  CourseRatingsRoute({
    required int courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CourseRatingsRoute.name,
          args: CourseRatingsRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseRatingsRoute';

  static const PageInfo<CourseRatingsRouteArgs> page =
      PageInfo<CourseRatingsRouteArgs>(name);
}

class CourseRatingsRouteArgs {
  const CourseRatingsRouteArgs({
    required this.courseId,
    this.key,
  });

  final int courseId;

  final Key? key;

  @override
  String toString() {
    return 'CourseRatingsRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [DragAndDropContentPage]
class DragAndDropContentRoute extends PageRouteInfo<void> {
  const DragAndDropContentRoute({List<PageRouteInfo>? children})
      : super(
          DragAndDropContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'DragAndDropContentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExplorePage]
class ExploreRoute extends PageRouteInfo<ExploreRouteArgs> {
  ExploreRoute({
    Key? key,
    PageProps? filterProps,
    List<PageRouteInfo>? children,
  }) : super(
          ExploreRoute.name,
          args: ExploreRouteArgs(
            key: key,
            filterProps: filterProps,
          ),
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static const PageInfo<ExploreRouteArgs> page =
      PageInfo<ExploreRouteArgs>(name);
}

class ExploreRouteArgs {
  const ExploreRouteArgs({
    this.key,
    this.filterProps,
  });

  final Key? key;

  final PageProps? filterProps;

  @override
  String toString() {
    return 'ExploreRouteArgs{key: $key, filterProps: $filterProps}';
  }
}

/// generated route for
/// [FillTheGapsContentPage]
class FillTheGapsContentRoute extends PageRouteInfo<void> {
  const FillTheGapsContentRoute({List<PageRouteInfo>? children})
      : super(
          FillTheGapsContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'FillTheGapsContentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoggedInPage]
class LoggedInRoute extends PageRouteInfo<void> {
  const LoggedInRoute({List<PageRouteInfo>? children})
      : super(
          LoggedInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoggedInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MyCoursesPage]
class MyCoursesRoute extends PageRouteInfo<void> {
  const MyCoursesRoute({List<PageRouteInfo>? children})
      : super(
          MyCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PurchasedCourseDetailsPage]
class PurchasedCourseDetailsRoute
    extends PageRouteInfo<PurchasedCourseDetailsRouteArgs> {
  PurchasedCourseDetailsRoute({
    required int courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PurchasedCourseDetailsRoute.name,
          args: PurchasedCourseDetailsRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PurchasedCourseDetailsRoute';

  static const PageInfo<PurchasedCourseDetailsRouteArgs> page =
      PageInfo<PurchasedCourseDetailsRouteArgs>(name);
}

class PurchasedCourseDetailsRouteArgs {
  const PurchasedCourseDetailsRouteArgs({
    required this.courseId,
    this.key,
  });

  final int courseId;

  final Key? key;

  @override
  String toString() {
    return 'PurchasedCourseDetailsRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [PurchasedCourseRatingsPage]
class PurchasedCourseRatingsRoute
    extends PageRouteInfo<PurchasedCourseRatingsRouteArgs> {
  PurchasedCourseRatingsRoute({
    required int courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PurchasedCourseRatingsRoute.name,
          args: PurchasedCourseRatingsRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PurchasedCourseRatingsRoute';

  static const PageInfo<PurchasedCourseRatingsRouteArgs> page =
      PageInfo<PurchasedCourseRatingsRouteArgs>(name);
}

class PurchasedCourseRatingsRouteArgs {
  const PurchasedCourseRatingsRouteArgs({
    required this.courseId,
    this.key,
  });

  final int courseId;

  final Key? key;

  @override
  String toString() {
    return 'PurchasedCourseRatingsRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [QuizContentPage]
class QuizContentRoute extends PageRouteInfo<void> {
  const QuizContentRoute({List<PageRouteInfo>? children})
      : super(
          QuizContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizContentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizContentResultsPage]
class QuizContentResultsRoute extends PageRouteInfo<void> {
  const QuizContentResultsRoute({List<PageRouteInfo>? children})
      : super(
          QuizContentResultsRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizContentResultsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RequestNewPasswordPage]
class RequestNewPasswordRoute
    extends PageRouteInfo<RequestNewPasswordRouteArgs> {
  RequestNewPasswordRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RequestNewPasswordRoute.name,
          args: RequestNewPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RequestNewPasswordRoute';

  static const PageInfo<RequestNewPasswordRouteArgs> page =
      PageInfo<RequestNewPasswordRouteArgs>(name);
}

class RequestNewPasswordRouteArgs {
  const RequestNewPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RequestNewPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ScratchContentPage]
class ScratchContentRoute extends PageRouteInfo<void> {
  const ScratchContentRoute({List<PageRouteInfo>? children})
      : super(
          ScratchContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScratchContentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShoppingCartPage]
class ShoppingCartRoute extends PageRouteInfo<void> {
  const ShoppingCartRoute({List<PageRouteInfo>? children})
      : super(
          ShoppingCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabsPage]
class TabsRoute extends PageRouteInfo<void> {
  const TabsRoute({List<PageRouteInfo>? children})
      : super(
          TabsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoContentPage]
class VideoContentRoute extends PageRouteInfo<void> {
  const VideoContentRoute({List<PageRouteInfo>? children})
      : super(
          VideoContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoContentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
