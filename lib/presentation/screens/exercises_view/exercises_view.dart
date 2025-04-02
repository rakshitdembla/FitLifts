import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/data/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ExercisesView extends StatelessWidget {
  final String appBarTitle;
  final List<Exercise> exercisesList;
  const ExercisesView({
    super.key,
    required this.appBarTitle,
    required this.exercisesList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: exercisesList.length,
        itemBuilder: (context, index) {
          Exercise exercise = exercisesList[index];
          return ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
            subtitle: Text(
              exercise.equipment,
              style: TextStyle(color: MyColors.greyText),
            ),
            title: Text(
              exercise.name,
              style: TextStyle(
                color: MyColors.primaryWhite,
                fontWeight: FontWeight.w900,
                fontSize: 15.sp,
              ),
            ),
            iconColor: MyColors.primaryWhite,
            collapsedIconColor: MyColors.primaryWhite,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Target Muscle - ${exercise.targetMuscle}",
                      style: TextStyle(
                        color: MyColors.graphBarCyan,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      "Secondary Muscle - ${exercise.secondaryMuscles?.join(",").replaceAll(",", ", ").toString() ?? "none"}",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 226, 225, 225),
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Instructions",
                      style: TextStyle(
                        color: MyColors.gold,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      exercise.instructions
                          .split("\n")
                          .map((line) => line.trim())
                          .join("\n\n").trimRight() ,
                      style: TextStyle(color: MyColors.whiteText,fontSize: 13.sp),
                    ),
                    SizedBox(height: 15.h),
                    
                    Text(
                      "Common Mistakes",
                      style: TextStyle(
                        color: MyColors.fieryRed,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      exercise.commonMistakes
                          .split("\n")
                          .map((line) => (line.trim()))
                          .join("\n\n").trimRight(),
                      style: TextStyle(color: MyColors.whiteText,fontSize: 13.sp),
                    ),
                    SizedBox(height: 15.h,)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
