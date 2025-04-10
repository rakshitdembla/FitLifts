import 'package:auto_route/annotations.dart';
import 'package:fitlifts/presentation/screens/general/settings/info/info_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../../services/providers/ads_provider.dart';

@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
            'Privacy Policy',
            style: TextStyle(color: MyColors.whiteText),
          ),
          backgroundColor: MyColors.primaryCharcoal,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: MyColors.whiteText),
        ),
        backgroundColor: MyColors.primaryCharcoal,
        body:  SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.whiteText,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Your privacy is our top priority. FitLifts ensures that all your fitness data is stored locally on your device, giving you complete control over your personal information.",
                  style: TextStyle(fontSize: 16.sp, color: MyColors.whiteText),
                ),
                SizedBox(height: 16.h),
                Text(
                  "How We Handle Your Data:",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.whiteText,
                  ),
                ),
                SizedBox(height: 8.h),
                InfoTextWidget(
                  text:
                      "🔒 Local Storage - All your fitness data, including workouts, progress images, and stats, are stored on your device only.",
                ),
                InfoTextWidget(
                  text:
                      "🛡️ No Cloud Storage - We do not upload or store your fitness data on any cloud servers. Your data remains completely private.",
                ),
                InfoTextWidget(
                  text:
                      "📊 Minimal Data on Cloud - We only store essential details like your name, email, age, gender, and body weight using Firebase for login purposes.",
                ),
                InfoTextWidget(
                  text:
                      "📥 Premium Local Backup - As a premium feature, you can export and import your data for backup. No cloud involvement—your data stays with you.",
                ),
                InfoTextWidget(
                  text:
                      "🗑️ Full Data Control - You can delete all your data from your device anytime through the settings page.",
                ),
                InfoTextWidget(
                  text:
                      "🔑 Secure Login - We use Firebase authentication to ensure secure login while keeping your personal data minimal.",
                ),
              ],
            ),
          ),
      
      ),
    );
  }
}
