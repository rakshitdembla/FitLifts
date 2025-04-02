import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/data/models/history_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceCard extends StatelessWidget {
  final HistoryDataModel historyDataModel;

  const PerformanceCard({super.key, required this.historyDataModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            "${historyDataModel.day}, ${historyDataModel.date}",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: MyColors.whiteText,
            ),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: Card(
            color: MyColors.darkGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.directions_walk_outlined,
                        color: MyColors.graphBarCyan,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Steps -> ${historyDataModel.steps}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                          color: MyColors.whiteText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),

                  Row(
                    children: [
                      Icon(
                        Icons.fitness_center_outlined,
                        color: Colors.deepOrangeAccent,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Workout Volume -> ${historyDataModel.workoutVolume} kg",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                          color: MyColors.whiteText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),

                  Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.greenAccent),
                      SizedBox(width: 8),
                      Text(
                        "Distance Travelled -> ${historyDataModel.distance} km",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                          color: MyColors.whiteText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),

                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_outlined,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Calories Burnt (Steps) -> ${historyDataModel.stepsCalories}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                          color: MyColors.whiteText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),

                  Row(
                    children: [
                      Icon(Icons.bolt_outlined, color: Colors.yellowAccent),
                      SizedBox(width: 8),
                      Text(
                        "Calories Burnt (Workout) -> ${historyDataModel.workoutCalories}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                          color: MyColors.whiteText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
