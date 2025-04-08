import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/my_colors.dart';

class SettingsTile extends StatelessWidget {
  final Widget trailingWidget;
  final String title;
  final GestureTapCallback? onTapAction;
  const SettingsTile({
    required this.title,
    required this.trailingWidget,
    this.onTapAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAction ,
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: ListTile(
         
          contentPadding: EdgeInsets.zero,
          leading: Text(
            title,
            style: TextStyle(
              color: MyColors.whiteText,
              fontWeight: FontWeight.w700,
              fontSize: 17.sp,
            ),
          ),
          trailing: trailingWidget,
        ),
      ),
    );
  }
}
