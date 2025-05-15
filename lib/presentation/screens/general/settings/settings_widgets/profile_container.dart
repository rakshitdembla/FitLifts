import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileContainer extends StatelessWidget {
  final String? profilePicture;
  final String? username;
  final String? email;
  final double? bodyWeight;
  final String? gender;
  final bool isPremiumUser;

  const ProfileContainer({
    super.key,
    required this.bodyWeight,
    required this.email,
    required this.gender,
    required this.profilePicture,
    required this.username,
    required this.isPremiumUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit_note,
                color: MyColors.whiteText,
                size: 18.r,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  child: ClipOval(
                    child:
                        profilePicture != null && profilePicture!.isNotEmpty
                            ? Image.network(
                              profilePicture!,
                              fit: BoxFit.cover,
                              width: 70.w,
                              height: 70.h,
                            )
                            : Icon(Icons.person, size: 32.5.r),
                  ),
                ),
                SizedBox(width: 30.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username ?? "User",
                        style: TextStyle(
                          color: MyColors.whiteText,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        email ?? "user@example.com",
                        style: TextStyle(
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Body Weight - $bodyWeight kg",
                        style: TextStyle(
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w900,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
