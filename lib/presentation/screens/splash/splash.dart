import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/screens/splash/splash_navigation.dart';
import 'package:flutter/material.dart';

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
      body: Center(child: CircularProgressIndicator(color: MyColors.whiteText)),
    );
  }
}
