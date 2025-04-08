import 'package:fitlifts/check_premium.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/core/constants/my_fonts.dart';
import 'package:fitlifts/presentation/routes/auto_router.dart';
import 'package:fitlifts/presentation/screens/general/settings/add_custom_exercise/add_custom_exercise_provider.dart';
import 'package:fitlifts/presentation/screens/general/settings/export_import_db/export_import_db.dart';
import 'package:fitlifts/presentation/screens/general/settings/settings_provider.dart';
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/add_workout_provider.dart';
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/workouts_list/fetch_all_provider.dart';
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/workouts_list/search/search_provider.dart';
import 'package:fitlifts/presentation/screens/auth/login/forgot%20password/forgot_pass_provider.dart';
import 'package:fitlifts/presentation/screens/auth/login/login_provider.dart';
import 'package:fitlifts/presentation/screens/auth/profile/profile_provider.dart';
import 'package:fitlifts/presentation/screens/auth/providers/social_login_provider.dart';
import 'package:fitlifts/presentation/screens/auth/register/register_provider.dart';
import 'package:fitlifts/presentation/screens/general/gallery/add_progress_image/add_progress_provider.dart';
import 'package:fitlifts/presentation/screens/general/gallery/gallery_view/gallery_view_provider.dart';
import 'package:fitlifts/presentation/screens/general/gallery/gallery_provider.dart';
import 'package:fitlifts/presentation/screens/general/history/providers/history_data_provider.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/home/home_provider.dart';
import 'package:fitlifts/presentation/screens/general/workouts/workout_provider.dart';
import 'package:fitlifts/presentation/screens/unlock_premium/unlock_premium_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/general/history/providers/chart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "assets/.env");
  await Utils.requestPermissions();
  BackgroundIsolateBinaryMessenger.ensureInitialized(
    RootIsolateToken.instance!,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  BackgroundIsolateBinaryMessenger.instance;
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,

      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<SearchProvider>(
              create: (context) => SearchProvider(),
            ),
            ChangeNotifierProvider<AddWorkoutProvider>(
              create: (context) => AddWorkoutProvider(),
            ),
            ChangeNotifierProvider<AddProgressProvider>(
              create: (context) => AddProgressProvider(),
            ),
            ChangeNotifierProvider<GalleryProvider>(
              create: (context) => GalleryProvider(),
            ),
            ChangeNotifierProvider<ChartProvider>(
              create: (context) => ChartProvider(),
            ),
            ChangeNotifierProvider<HistoryDataProvider>(
              create: (context) => HistoryDataProvider(),
            ),
            ChangeNotifierProvider<GalleryViewProvider>(
              create: (context) => GalleryViewProvider(),
            ),
            ChangeNotifierProvider<LoginProvider>(
              create: (context) => LoginProvider(),
            ),
            ChangeNotifierProvider<SocialLoginProvider>(
              create: (context) => SocialLoginProvider(),
            ),
            ChangeNotifierProvider<ForgotPassProvider>(
              create: (context) => ForgotPassProvider(),
            ),
            ChangeNotifierProvider<RegisterProvider>(
              create: (context) => RegisterProvider(),
            ),
            ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(),
            ),
            ChangeNotifierProvider<ProfileProvider>(
              create: (context) => ProfileProvider(),
            ),
            ChangeNotifierProvider<FetchWorkoutsProvider>(
              create: (context) => FetchWorkoutsProvider(),
            ),
            ChangeNotifierProvider<LocalExercisesProvider>(
              create: (context) => LocalExercisesProvider(),
            ),
            ChangeNotifierProvider<SettingsProvider>(
              create: (context) => SettingsProvider(),
            ),
            ChangeNotifierProvider<AddCustomExerciseProvider>(
              create: (context) => AddCustomExerciseProvider(),
            ),
            ChangeNotifierProvider<UnlockPremiumProvider>(
              create: (context) => UnlockPremiumProvider(),
            ),
            ChangeNotifierProvider<CheckPremium>(
              create: (context) => CheckPremium(),
            ),
            ChangeNotifierProvider<ExportImportDbProvider>(
              create: (context) => ExportImportDbProvider(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: 'FitLifts',
            theme: ThemeData(
              textTheme: MyFonts.fontTheme,
              fontFamily: MyFonts.interFont,
              colorScheme: ColorScheme.fromSeed(
                seedColor: MyColors.electricBlue,
              ),
            ),
          ),
        );
      },
    );
  }
}
