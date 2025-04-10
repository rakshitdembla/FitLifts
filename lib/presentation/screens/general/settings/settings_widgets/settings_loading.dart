import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsLoading extends StatefulWidget {
  const SettingsLoading({super.key});

  @override
  State<SettingsLoading> createState() => _SettingsLoadingState();
}

class _SettingsLoadingState extends State<SettingsLoading> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                                height: 24.h,
                                width: 24.w,

                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: MyColors.whiteText,
                                ),
                              );
  }
}