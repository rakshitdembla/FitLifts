import 'package:auto_route/annotations.dart';
import 'package:fitlifts/presentation/screens/general/settings/info/info_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../../services/providers/ads_provider.dart';

@RoutePage()
class TrackingAccuracyPage extends StatelessWidget {
  const TrackingAccuracyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        AdsProvider adsProvider = Provider.of<AdsProvider>(
          context,
          listen: false,
        );

        if (didPop) {
          if (adsProvider.isSettingsAdLoaded) {
            adsProvider.settingsAd!.show();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text(
            'Tracking Accuracy',
            style: TextStyle(color: MyColors.whiteText),
          ),
          backgroundColor: MyColors.primaryCharcoal,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: MyColors.whiteText),
        ),
        backgroundColor: MyColors.primaryCharcoal,
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tracking Accuracy',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.whiteText,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Step and calorie tracking accuracy may vary depending on your device's built-in sensors. Some phones may undercount or overcount steps due to hardware limitations or any other restrictions.",
                  style: TextStyle(fontSize: 16.sp, color: MyColors.whiteText),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Tips to Improve Accuracy:",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.whiteText,
                  ),
                ),
                SizedBox(height: 8.h),
                InfoTextWidget(
                  text:
                      "🔄 Try restarting your phone if steps aren't tracking properly—it helps recalibrate sensors.",
                ),
                InfoTextWidget(
                  text:
                      "🔓 Make sure you've granted all required permissions for physical activity tracking to ensure accurate step counting.",
                ),
                InfoTextWidget(
                  text:
                      "⚠️ FitLifts does not run step tracking in the background to save battery. Simply tap 'Start Tracking' when you're in the app to track steps in real-time.",
                ),
                InfoTextWidget(
                  text:
                      "🔋 This approach helps conserve battery life by avoiding constant sensor access in the background while still giving you full control.",
                ),
      
                SizedBox(height: 16.h),
                Text(
                  "Calories & Distance Calculation",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.whiteText,
                  ),
                ),
                SizedBox(height: 8.h),
                InfoTextWidget(
                  text:
                      "🔥 Calories burned from steps are estimated based on your body weight, which is auto-filled from your profile or your latest uploaded progress photo.",
                ),
                InfoTextWidget(
                  text:
                      "📏 Distance walked is calculated using an average step length. While it's not exact, we try to keep it as accurate as possible for most users.",
                ),
                InfoTextWidget(
                  text:
                      "📝 You can manually update your body weight from the Settings or Profile page at any time for more accurate calorie calculations.",
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}
