import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/data/models/exercise.dart';
import 'package:fitlifts/presentation/common_widgets/circular_progress.dart';
import 'package:fitlifts/presentation/screens/general/workouts/exercises_view/exercises_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/ads_provider.dart';

@RoutePage()
class ExercisesView extends StatefulWidget {
  final String appBarTitle;
  final List<Exercise> exercisesList;
  const ExercisesView({
    super.key,
    required this.appBarTitle,
    required this.exercisesList,
  });

  @override
  State<ExercisesView> createState() => _ExercisesViewState();
}

class _ExercisesViewState extends State<ExercisesView> {
  bool gotInitialData = false;
  @override
  void initState() {
    Provider.of<AdsProvider>(context, listen: false).initializeWorkoutAd(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!gotInitialData) {
      Provider.of<ExercisesViewProvider>(context, listen: false).loadingDelay();}
      gotInitialData = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          AdsProvider adsProvider = Provider.of<AdsProvider>(
            context,
            listen: false,
          );
          if (adsProvider.isWorkoutsAdLoaded) {
            adsProvider.workoutsAd!.show();
          }
        }
      },

      child: Scaffold(
        backgroundColor: MyColors.primaryCharcoal,
        appBar: AppBar(
          foregroundColor: MyColors.primaryCharcoal,
          backgroundColor: MyColors.primaryCharcoal,
          scrolledUnderElevation: 0.0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: MyColors.whiteText),
          centerTitle: true,
          title: Text(
            widget.appBarTitle,
            style: TextStyle(
              color: MyColors.whiteText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body:
            Provider.of<ExercisesViewProvider>(context).isLoading
                ? CircularProgressLoading()
                : ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.exercisesList.length,
                  itemBuilder: (context, index) {
                    Exercise exercise = widget.exercisesList[index];
                    return ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 4.h,
                      ),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Target Muscle - ${exercise.targetMuscle}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      122,
                                      169,
                                      250,
                                    ),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  "Secondary Muscle - ${exercise.secondaryMuscles?.join(",").replaceAll(",", ", ").toString() ?? "none"}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      226,
                                      225,
                                      225,
                                    ),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  "Instructions",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      223,
                                      126,
                                    ),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  exercise.instructions
                                      .split("\n")
                                      .map((line) => line.trim())
                                      .join("\n\n")
                                      .trimRight(),
                                  style: TextStyle(
                                    color: MyColors.whiteText,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(height: 15.h),

                                Text(
                                  "Common Mistakes",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      163,
                                      130,
                                    ),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  exercise.commonMistakes
                                      .split("\n")
                                      .map((line) => (line.trim()))
                                      .join("\n\n")
                                      .trimRight(),
                                  style: TextStyle(
                                    color: MyColors.whiteText,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
      ),
    );
  }
}
