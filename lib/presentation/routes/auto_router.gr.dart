// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:fitlifts/data/models/exercise.dart' as _i21;
import 'package:fitlifts/presentation/screens/auth/login/forgot%20password/forgot_password.dart'
    as _i5;
import 'package:fitlifts/presentation/screens/auth/login/login_imports.dart'
    as _i7;
import 'package:fitlifts/presentation/screens/auth/profile/profile.dart'
    as _i17;
import 'package:fitlifts/presentation/screens/auth/register/register_imports.dart'
    as _i10;
import 'package:fitlifts/presentation/screens/general/general.dart' as _i6;
import 'package:fitlifts/presentation/screens/general/settings/add_custom_exercise/add_custom_exercise_imports.dart'
    as _i2;
import 'package:fitlifts/presentation/screens/general/settings/info/fitlifts_about.dart'
    as _i1;
import 'package:fitlifts/presentation/screens/general/settings/info/fitlifts_privacy.dart'
    as _i8;
import 'package:fitlifts/presentation/screens/general/settings/info/fitlifts_tracking_accuracy.dart'
    as _i14;
import 'package:fitlifts/presentation/screens/general/settings/update_profile/update_profile_imports.dart'
    as _i16;
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/add_workout_imports.dart'
    as _i3;
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/workouts_list/search/search_exercise.dart'
    as _i11;
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/workouts_list/workouts_list.dart'
    as _i18;
import 'package:fitlifts/presentation/screens/general/workouts/exercises_view/exercises_view.dart'
    as _i4;
import 'package:fitlifts/presentation/screens/splash/splash.dart' as _i12;
import 'package:fitlifts/presentation/screens/unlock_premium/unlock_premium_imports.dart'
    as _i15;
import 'package:fitlifts/presentation/web_views/privacy_web.dart' as _i9;
import 'package:fitlifts/presentation/web_views/terms_conditions_web.dart'
    as _i13;
import 'package:flutter/material.dart' as _i20;

/// generated route for
/// [_i1.AboutPage]
class AboutPageRoute extends _i19.PageRouteInfo<void> {
  const AboutPageRoute({List<_i19.PageRouteInfo>? children})
    : super(AboutPageRoute.name, initialChildren: children);

  static const String name = 'AboutPageRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutPage();
    },
  );
}

/// generated route for
/// [_i2.AddCustomExercise]
class AddCustomExerciseRoute extends _i19.PageRouteInfo<void> {
  const AddCustomExerciseRoute({List<_i19.PageRouteInfo>? children})
    : super(AddCustomExerciseRoute.name, initialChildren: children);

  static const String name = 'AddCustomExerciseRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddCustomExercise();
    },
  );
}

/// generated route for
/// [_i3.AddWorkout]
class AddWorkoutRoute extends _i19.PageRouteInfo<void> {
  const AddWorkoutRoute({List<_i19.PageRouteInfo>? children})
    : super(AddWorkoutRoute.name, initialChildren: children);

  static const String name = 'AddWorkoutRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddWorkout();
    },
  );
}

/// generated route for
/// [_i4.ExercisesView]
class ExercisesViewRoute extends _i19.PageRouteInfo<ExercisesViewRouteArgs> {
  ExercisesViewRoute({
    _i20.Key? key,
    required String appBarTitle,
    required List<_i21.Exercise> exercisesList,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ExercisesViewRoute.name,
         args: ExercisesViewRouteArgs(
           key: key,
           appBarTitle: appBarTitle,
           exercisesList: exercisesList,
         ),
         initialChildren: children,
       );

  static const String name = 'ExercisesViewRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExercisesViewRouteArgs>();
      return _i4.ExercisesView(
        key: args.key,
        appBarTitle: args.appBarTitle,
        exercisesList: args.exercisesList,
      );
    },
  );
}

class ExercisesViewRouteArgs {
  const ExercisesViewRouteArgs({
    this.key,
    required this.appBarTitle,
    required this.exercisesList,
  });

  final _i20.Key? key;

  final String appBarTitle;

  final List<_i21.Exercise> exercisesList;

  @override
  String toString() {
    return 'ExercisesViewRouteArgs{key: $key, appBarTitle: $appBarTitle, exercisesList: $exercisesList}';
  }
}

/// generated route for
/// [_i5.ForgotPasswordScreen]
class ForgotPasswordScreenRoute
    extends _i19.PageRouteInfo<ForgotPasswordScreenRouteArgs> {
  ForgotPasswordScreenRoute({
    _i20.Key? key,
    String? email,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ForgotPasswordScreenRoute.name,
         args: ForgotPasswordScreenRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'ForgotPasswordScreenRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordScreenRouteArgs>(
        orElse: () => const ForgotPasswordScreenRouteArgs(),
      );
      return _i5.ForgotPasswordScreen(key: args.key, email: args.email);
    },
  );
}

class ForgotPasswordScreenRouteArgs {
  const ForgotPasswordScreenRouteArgs({this.key, this.email});

  final _i20.Key? key;

  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordScreenRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i6.General]
class GeneralRoute extends _i19.PageRouteInfo<void> {
  const GeneralRoute({List<_i19.PageRouteInfo>? children})
    : super(GeneralRoute.name, initialChildren: children);

  static const String name = 'GeneralRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i6.General();
    },
  );
}

/// generated route for
/// [_i7.LoginScreen]
class LoginScreenRoute extends _i19.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i19.PageRouteInfo>? children})
    : super(LoginScreenRoute.name, initialChildren: children);

  static const String name = 'LoginScreenRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginScreen();
    },
  );
}

/// generated route for
/// [_i8.PrivacyPolicyPage]
class PrivacyPolicyPageRoute extends _i19.PageRouteInfo<void> {
  const PrivacyPolicyPageRoute({List<_i19.PageRouteInfo>? children})
    : super(PrivacyPolicyPageRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyPageRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [_i9.PrivacyWeb]
class PrivacyWebRoute extends _i19.PageRouteInfo<void> {
  const PrivacyWebRoute({List<_i19.PageRouteInfo>? children})
    : super(PrivacyWebRoute.name, initialChildren: children);

  static const String name = 'PrivacyWebRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.PrivacyWeb();
    },
  );
}

/// generated route for
/// [_i10.RegisterScreen]
class RegisterScreenRoute extends _i19.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i19.PageRouteInfo>? children})
    : super(RegisterScreenRoute.name, initialChildren: children);

  static const String name = 'RegisterScreenRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i11.SearchExercise]
class SearchExerciseRoute extends _i19.PageRouteInfo<SearchExerciseRouteArgs> {
  SearchExerciseRoute({
    _i20.Key? key,
    required List<List<_i21.Exercise>> allExercises,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         SearchExerciseRoute.name,
         args: SearchExerciseRouteArgs(key: key, allExercises: allExercises),
         initialChildren: children,
       );

  static const String name = 'SearchExerciseRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchExerciseRouteArgs>();
      return _i11.SearchExercise(
        key: args.key,
        allExercises: args.allExercises,
      );
    },
  );
}

class SearchExerciseRouteArgs {
  const SearchExerciseRouteArgs({this.key, required this.allExercises});

  final _i20.Key? key;

  final List<List<_i21.Exercise>> allExercises;

  @override
  String toString() {
    return 'SearchExerciseRouteArgs{key: $key, allExercises: $allExercises}';
  }
}

/// generated route for
/// [_i12.SplashScreen]
class SplashScreenRoute extends _i19.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i19.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.TermsConditionsWeb]
class TermsConditionsWebRoute extends _i19.PageRouteInfo<void> {
  const TermsConditionsWebRoute({List<_i19.PageRouteInfo>? children})
    : super(TermsConditionsWebRoute.name, initialChildren: children);

  static const String name = 'TermsConditionsWebRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.TermsConditionsWeb();
    },
  );
}

/// generated route for
/// [_i14.TrackingAccuracyPage]
class TrackingAccuracyPageRoute extends _i19.PageRouteInfo<void> {
  const TrackingAccuracyPageRoute({List<_i19.PageRouteInfo>? children})
    : super(TrackingAccuracyPageRoute.name, initialChildren: children);

  static const String name = 'TrackingAccuracyPageRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i14.TrackingAccuracyPage();
    },
  );
}

/// generated route for
/// [_i15.UnlockPremium]
class UnlockPremiumRoute extends _i19.PageRouteInfo<void> {
  const UnlockPremiumRoute({List<_i19.PageRouteInfo>? children})
    : super(UnlockPremiumRoute.name, initialChildren: children);

  static const String name = 'UnlockPremiumRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i15.UnlockPremium();
    },
  );
}

/// generated route for
/// [_i16.UpdateProfilePage]
class UpdateProfilePageRoute
    extends _i19.PageRouteInfo<UpdateProfilePageRouteArgs> {
  UpdateProfilePageRoute({
    _i20.Key? key,
    required double? previousBodyWeight,
    required String? previousName,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         UpdateProfilePageRoute.name,
         args: UpdateProfilePageRouteArgs(
           key: key,
           previousBodyWeight: previousBodyWeight,
           previousName: previousName,
         ),
         initialChildren: children,
       );

  static const String name = 'UpdateProfilePageRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateProfilePageRouteArgs>();
      return _i16.UpdateProfilePage(
        key: args.key,
        previousBodyWeight: args.previousBodyWeight,
        previousName: args.previousName,
      );
    },
  );
}

class UpdateProfilePageRouteArgs {
  const UpdateProfilePageRouteArgs({
    this.key,
    required this.previousBodyWeight,
    required this.previousName,
  });

  final _i20.Key? key;

  final double? previousBodyWeight;

  final String? previousName;

  @override
  String toString() {
    return 'UpdateProfilePageRouteArgs{key: $key, previousBodyWeight: $previousBodyWeight, previousName: $previousName}';
  }
}

/// generated route for
/// [_i17.UserProfileScreen]
class UserProfileScreenRoute extends _i19.PageRouteInfo<void> {
  const UserProfileScreenRoute({List<_i19.PageRouteInfo>? children})
    : super(UserProfileScreenRoute.name, initialChildren: children);

  static const String name = 'UserProfileScreenRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.UserProfileScreen();
    },
  );
}

/// generated route for
/// [_i18.WorkoutsList]
class WorkoutsListRoute extends _i19.PageRouteInfo<void> {
  const WorkoutsListRoute({List<_i19.PageRouteInfo>? children})
    : super(WorkoutsListRoute.name, initialChildren: children);

  static const String name = 'WorkoutsListRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.WorkoutsList();
    },
  );
}
