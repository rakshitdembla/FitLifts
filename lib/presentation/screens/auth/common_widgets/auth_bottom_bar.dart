import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/my_colors.dart';

class AuthBottomBar extends StatelessWidget {
  final String text1;
  final String text2;
  final GestureTapCallback? onPressed;
  const AuthBottomBar({super.key,required this.text1,required this.text2,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RichText(
                text: TextSpan(
                  text: text1,
                  style: GoogleFonts.poppins(
                   
                    color: MyColors.greyText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(   
                      recognizer: TapGestureRecognizer()..onTap = onPressed ,
                      text: " $text2",
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(41, 121, 255, 1),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
  }
}