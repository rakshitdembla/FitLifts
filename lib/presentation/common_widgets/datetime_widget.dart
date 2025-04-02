import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/constants/my_colors.dart';

class DateTimeWidget extends StatefulWidget {
  final bool showDate;

  const DateTimeWidget({super.key, required this.showDate});

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.showDate ? "Date & Time :" : "Date :",
          style: TextStyle(
            color: MyColors.whiteText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          DateFormat(
            widget.showDate ? "yy-MM-dd, hh:mm a" : "yyyy-MM-dd",
          ).format(DateTime.now()).toString(),
          style: TextStyle(
            color: MyColors.whiteText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
