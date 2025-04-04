import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/my_colors.dart';

class InfoTextWidget extends StatelessWidget {
  final String text;
  const InfoTextWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp, color: MyColors.whiteText),
      ),
    );
  }
  }
