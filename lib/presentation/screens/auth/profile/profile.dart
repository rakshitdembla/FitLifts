import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_assets.dart';
import 'package:fitlifts/presentation/screens/auth/profile/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/my_colors.dart';
import '../common_widgets/auth_title.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque, 
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: MyColors.primaryCharcoal,
        appBar: AppBar(
          backgroundColor: MyColors.primaryCharcoal,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: MyColors.whiteText),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          
           padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 13.h),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthTitle(
                    h1: 'Complete Your Profile',
                    h2: "Commit to Fit - Let's Begin!",
                  ),
                  SizedBox(height: 10.h),
                  SvgPicture.asset(
                    Assets.assetsGymVector,
                    height: 250.h,
                    width: MediaQuery.of(context).size.width,
                  ),
      
                  SizedBox(height: 12.h),
                ],
              ),
              ProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
