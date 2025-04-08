import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Advantages extends StatelessWidget {
  final Icon icon;
  final String h1;
  final String h2;
  const Advantages({
    super.key,
    required this.h1,
    required this.h2,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
          ),
          child: icon,
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                h1,
                style: TextStyle(
                  color: MyColors.whiteText,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.5.h),

              Text(
                h2,
                style: TextStyle(
                  color: MyColors.greyText,

                  fontWeight: FontWeight.w900,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
