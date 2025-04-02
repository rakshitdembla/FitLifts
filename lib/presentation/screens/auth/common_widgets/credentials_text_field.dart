import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/my_colors.dart';

class CredentialsField extends StatefulWidget {
  final String label;
  final FocusNode focusNode;
  final ValueChanged<String>? onSubmitted;
  final int maxLength;
  final Icon prefixIcon;
  final String hinttext;
  final bool isPassword;
  final TextEditingController controller;

  const CredentialsField({
    super.key,
    required this.label,
    required this.focusNode,
    required this.hinttext,
    required this.maxLength,
    required this.onSubmitted,
    required this.prefixIcon,
    required this.isPassword,
    required this.controller
  });

  @override
  State<CredentialsField> createState() => _CredentialsFieldState();
}

class _CredentialsFieldState extends State<CredentialsField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: MyColors.greyText,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.h),
        TextField(
          controller: widget.controller,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          onSubmitted: widget.onSubmitted,
          obscureText: widget.isPassword,

          cursorColor: const Color.fromARGB(171, 81, 144, 252),
          style: TextStyle(color: MyColors.whiteText),
          decoration: InputDecoration(
            
            counter: SizedBox.shrink(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            prefixIcon: widget.prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                color: const Color.fromARGB(171, 81, 144, 252),
              ), // Change focus border color
            ),

            hintText: widget.hinttext,
          ),
        ),
      ],
    );
  }
}
