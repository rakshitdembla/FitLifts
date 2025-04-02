import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/my_colors.dart';

class DivideTitle extends StatelessWidget {
  final String title;
  const DivideTitle({
    super.key,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //explore more title row
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: MyColors.primaryGrey,
            thickness: 1.0.r,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: Text(
            title,
            style: TextStyle(color: MyColors.primaryGrey),
          ),
        ),
        Expanded(
          child: Divider(
            color: MyColors.primaryGrey,
            thickness: 1.0.r,
          ),
        ),
      ],
    );
  }
}
