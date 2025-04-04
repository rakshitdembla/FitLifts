import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/presentation/screens/add_custom_exercise/add_custom_exercise_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder:TransitionsBuilders.slideLeftWithFade,
    duration: Duration(milliseconds: 700),
    reverseDuration: Duration(milliseconds: 700)
  );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GeneralRoute.page, path: "/", initial: true),
    AutoRoute(page: ExercisesViewRoute.page),
    AutoRoute(page: AddWorkoutRoute.page),
    AutoRoute(page: WorkoutsListRoute.page),
    AutoRoute(page: SearchExerciseRoute.page),
    AutoRoute(page: AddProgressRoute.page),
    AutoRoute(page: LoadingScreenRoute.page),
    AutoRoute(page: RegisterScreenRoute.page),
    AutoRoute(page: LoginScreenRoute.page),
    AutoRoute(page: GalleryViewRoute.page),
    AutoRoute(page: UnlockPremiumRoute.page),
    AutoRoute(page: SplashScreenRoute.page),
    AutoRoute(page: UserProfileScreenRoute.page),
    AutoRoute(page: ForgotPasswordScreenRoute.page),
    AutoRoute(page: AboutPageRoute.page),
    AutoRoute(page: PrivacyPolicyPageRoute.page),
    AutoRoute(page: AddCustomExerciseRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
