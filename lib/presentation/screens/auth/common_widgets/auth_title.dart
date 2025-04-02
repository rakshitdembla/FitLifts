import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/my_colors.dart';

class AuthTitle extends StatelessWidget {
  final String h1;
  final String h2;
  const AuthTitle({super.key,
  required this.h1,
  required this.h2
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
                h1,
                style: TextStyle(
                  color: MyColors.whiteText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5.h),
              Text(
                h2,
                style: TextStyle(
                  color: MyColors.greyText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    );
  }
}