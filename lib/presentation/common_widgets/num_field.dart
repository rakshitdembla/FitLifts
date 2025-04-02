import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/my_colors.dart';

class NumField extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String hintText;
  final int maxLength;
  const NumField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelTitle,
    required this.maxLength,
  });

  @override
  State<NumField> createState() => _NumFieldState();
}

class _NumFieldState extends State<NumField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelTitle,
          style: TextStyle(color: MyColors.greyText, fontSize: 12.sp),
        ),
        SizedBox(
          height: 32.5.h,
          width: double.infinity,
          child: TextField(
            cursorColor: MyColors.electricBlue,
            maxLength: widget.maxLength,

            controller: widget.controller,
            style: TextStyle(color: MyColors.whiteText, fontSize: 17.sp),

            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.electricBlue),
              ),

              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.electricBlue),
              ),

              counter: SizedBox.shrink(),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 16.5.sp),
            ),
          ),
        ),
      ],
    );
  }
}
