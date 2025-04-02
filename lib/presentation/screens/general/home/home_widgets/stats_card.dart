import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsCard extends StatelessWidget {
  final Color containerColor;
  final Icon icon;
  final String title;
  final String value;
  final String unit;
  const StatsCard({
    super.key,
    required this.containerColor,
    required this.icon,
    required this.title,
    required this.unit,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 10.h, 10.w, 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: MyColors.whiteText,
                  ),
                ),

                CircleAvatar(
                  radius: 17.r,
                  backgroundColor: MyColors.primaryWhite,
                  child: icon,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    
                    text: value,
                    style: TextStyle(
                      
                      
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.whiteText,
                    ),
                    children: [
                      TextSpan(
                        text: (" $unit"),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.whiteText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
