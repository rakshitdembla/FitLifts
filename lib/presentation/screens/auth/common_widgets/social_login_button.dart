import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/my_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final ImageProvider<Object> iconImage;
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.iconImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 35.h,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.pressed)) {
              return const Color.fromARGB(30, 33, 149, 243);
            }
            return null;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: const Color.fromARGB(62, 255, 255, 255),
                width: 1.0.w,
              ),
            ),
          ),

          foregroundColor: WidgetStateProperty.all(MyColors.whiteText),
          backgroundColor: WidgetStateProperty.all(MyColors.primaryCharcoal),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            SizedBox(height: 28.h, width: 28.w, child: Image(image: iconImage)),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: MyColors.primaryWhite,
              ),
            ),
              Spacer(),
          ],
        ),
      ),
    );
  }
}
