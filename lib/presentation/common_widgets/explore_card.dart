import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/my_colors.dart';

class ExploreCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  const ExploreCard({super.key, required this.imageAsset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity.w,
          height: 95.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
          ),
        ),

        Positioned.fill(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.whiteText,
                      fontSize: 17.sp,
                    ),
                  ),

                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: MyColors.whiteText,
                    size: 25.r,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
