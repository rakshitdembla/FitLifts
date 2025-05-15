import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AgreeToConditions extends StatefulWidget {
  const AgreeToConditions({super.key});

  @override
  State<AgreeToConditions> createState() => _AgreeToConditionsState();
}

class _AgreeToConditionsState extends State<AgreeToConditions> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By Continuing, you agree with FitLifts",
        style: GoogleFonts.poppins(color: MyColors.greyText,fontSize: 13.5.sp),
        children: [
          TextSpan(
            text: " Privacy Policy",
            style: GoogleFonts.poppins(
              color: MyColors.electricBlue,
              fontSize: 13.5.sp,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                  context.router.push(PrivacyWebRoute());
                  },
          ),
          TextSpan(
            text: " & ",
            style: GoogleFonts.poppins(
              color: MyColors.greyText,
              fontSize: 13.5.sp,
            ),
          ),
          TextSpan(
            text: "Terms and Conditions",
            style: GoogleFonts.poppins(
              color: MyColors.electricBlue,
              fontSize: 13.5.sp,
            ),
             recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                  context.router.push(TermsConditionsWebRoute());
                  },
          ),
        ],
      ),
    );
  }
}
