import 'package:auto_route/annotations.dart';
import 'package:fitlifts/presentation/screens/general/settings/info/info_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/my_colors.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(color: MyColors.whiteText)),
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),
      backgroundColor: MyColors.primaryCharcoal,
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About FitLifts',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.whiteText,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Welcome to FitLifts, the ultimate fitness companion built by a fitness freak who truly understands the struggles of tracking progress efficiently. Whether you're lifting weights, tracking your steps, or monitoring your body transformation, FitLifts makes it effortless—all while keeping your data 100% private and stored locally on your device.",
                style: TextStyle(fontSize: 16.sp, color: MyColors.whiteText),
              ),
              SizedBox(height: 16.h),
              Text(
                "Why FitLifts?",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.whiteText,
                ),
              ),
              SizedBox(height: 8.h),
              InfoTextWidget(
                text:
                    "💪 Track Your Workouts - Log your lifted weights, reps, and explore exercises for all muscle groups.",
              ),
              InfoTextWidget(
                text:
                    "📸 Visual Progress Monitoring - Capture daily gym progress with images, log body weight, and rate your pump.",
              ),
              InfoTextWidget(
                text:
                    "🚶‍♂️ Step & Calorie Tracking - Monitor steps, calories, and distance in real time with a single tap on Start Tracking.",
              ),
              InfoTextWidget(
                text:
                    "📊 7-Day Performance Insights - Auto-resetting step graphs with detailed lifetime stats on steps, workout volume, calories burned, and distance covered.",
              ),
              InfoTextWidget(
                text:
                    "🔒 Privacy-First Approach - All fitness data is stored locally, ensuring complete privacy.",
              ),
              InfoTextWidget(
                text:
                    "⭐ Premium Backup (No Cloud) - Export and import data directly on your device, no cloud involvement.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
