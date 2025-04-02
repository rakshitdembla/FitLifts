import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedCTA extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const ElevatedCTA({this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: double.infinity.w,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            const Color.fromRGBO(41, 121, 255, 1),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: MyColors.whiteText,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
