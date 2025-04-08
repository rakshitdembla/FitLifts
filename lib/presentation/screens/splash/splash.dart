import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_assets.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/screens/splash/splash_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashNavigation.splashNav(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.electricBlue,
      body: Center(
        child: SizedBox(
          height: 140.h,
          width: 140.w,
          child: Image.asset(Assets.assetsFitliftsLogo),
        ).animate().
        slideX(
          begin: -1.5,
          curve: Curves.easeInOut,
          duration: 600.ms,
        ),
      ),
    );
  }
}
