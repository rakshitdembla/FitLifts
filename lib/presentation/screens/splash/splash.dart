import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fitlifts/core/constants/my_assets.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/data/data_source/local/quotes_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String randomQuote;
  @override
  void initState() {
    List<String> quotes = QuotesData.quotes;
    if (quotes.isNotEmpty) {
      randomQuote = quotes[Random().nextInt(quotes.length)];
    } else {
      randomQuote = "Push harder than yesterday.";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBlack,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(Assets.assetsSplashImg, fit: BoxFit.cover),
          ),
          Positioned(
            top: 560.h,
            left: 25.w,
            right: 25.w,
            child: Column(
              children: [
                Text(
                  randomQuote,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.whiteText,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                LoadingAnimationWidget.stretchedDots(
                  color: MyColors.primaryWhite,
                  size: 50.r,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
