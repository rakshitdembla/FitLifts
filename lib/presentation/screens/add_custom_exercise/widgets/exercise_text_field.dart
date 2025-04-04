import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_colors.dart';

class ExerciseTextField extends StatefulWidget {
  final FocusNode focusNode;
  final ValueChanged<String>? onSubmitted;
  final int maxLength;
  final String hinttext;
  final bool isMultiline;
  final TextEditingController controller;
  const ExerciseTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hinttext,
    required this.maxLength,
    required this.onSubmitted,
     this.isMultiline = false ,
  
  });

  @override
  State<ExerciseTextField> createState() => _ExerciseTextFieldState();
}

class _ExerciseTextFieldState extends State<ExerciseTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      onSubmitted: widget.onSubmitted,

      cursorColor: const Color.fromARGB(171, 81, 144, 252),
      style: TextStyle(color: MyColors.whiteText),
      keyboardType: widget.isMultiline ? TextInputType.multiline : null,
      maxLines: widget.isMultiline ? null : 1,
      decoration: InputDecoration(
        counter: SizedBox.shrink(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: const Color.fromARGB(171, 81, 144, 252),
          ), // Change focus border color
        ),

        hintText: widget.hinttext,
      ),
    );
  }
}
