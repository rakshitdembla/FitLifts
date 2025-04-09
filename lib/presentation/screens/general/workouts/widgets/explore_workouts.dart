import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/my_assets.dart';
import '../../../../../data/data_source/local/exercises database/abs_exercises.dart';
import '../../../../../data/data_source/local/exercises database/arms_exercises.dart';
import '../../../../../data/data_source/local/exercises database/back_exercises.dart';
import '../../../../../data/data_source/local/exercises database/cardio_exercises.dart';
import '../../../../../data/data_source/local/exercises database/chest_exercises.dart';
import '../../../../../data/data_source/local/exercises database/legs_exercises.dart';
import '../../../../../data/data_source/local/exercises database/shoulder_exercises.dart';
import '../../../../common_widgets/explore_card.dart';
import '../../../../routes/auto_router.gr.dart';

class ExploreWorkouts extends StatelessWidget {
  const ExploreWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
              child: Column(
                children: [
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Abs Workouts",
                          exercisesList: absExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsFullBody,
                    title: 'Abs',
                  ),

                  SizedBox(height: 10.h),
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Cardio Workouts",
                          exercisesList: cardioExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsGirlCardio,
                    title: "Cardio",
                  ),

                  SizedBox(height: 10.h),
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Chest Workouts",
                          exercisesList: chestExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsChest,
                    title: "Chest",
                  ),

                  SizedBox(height: 10.h),
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Arms Workouts",
                          exercisesList: armsExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsArms,
                    title: "Arms",
                  ),

                  SizedBox(height: 10.h),
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Shoulder Workouts",
                          exercisesList: shoulderExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsShoulder,
                    title: "Shoulder",
                  ),

                  SizedBox(height: 10.h),
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Back Workouts",
                          exercisesList: backExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsBack,
                    title: "Back",
                  ),

                  SizedBox(height: 10.h),
                  ExploreCard(
                    onPressed: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Legs Workouts",
                          exercisesList: legExercises,
                        ),
                      );
                    },
                    imageAsset: Assets.assetsSquatsGirl,
                    title: "Legs",
                  ),
                ],
              ),
            );
        
  }
}