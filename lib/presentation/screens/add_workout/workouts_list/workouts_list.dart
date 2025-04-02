import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/core/utils/load_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../data/models/exercise.dart';

@RoutePage()
class WorkoutsList extends StatefulWidget {
  const WorkoutsList({super.key});

  @override
  State<WorkoutsList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  bool isLoading = true;
  List<List<Exercise>> allExercises = [];
  List<String> exerciseTitles = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    setState(() {
      UtilsLoadData.allExercisesList(allExercises, exerciseTitles);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                context.router.push(
                  SearchExerciseRoute(allExercises: allExercises),
                );
              },
              icon: Icon(Icons.search, size: 24.sp),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
        title: Text(
          "Select Exercise",
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body:
          isLoading
              ? Center(
                child: LoadingAnimationWidget.waveDots(
                  color: MyColors.whiteText,
                  size: 40.r,
                ),
              )
              : ListView.builder(
                itemBuilder: (context, index) {
                  String exerciseTitle = exerciseTitles[index];
                  List<Exercise> exercisesList = allExercises[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            exerciseTitle,
                            style: TextStyle(
                              color: MyColors.whiteText,
                              fontWeight: FontWeight.w900,
                              fontSize: 19.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        ListView.builder(
                          cacheExtent: 500,
                          itemExtent: 75,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exercisesList.length,
                          itemBuilder: (context, index) {
                            Exercise exercise = exercisesList[index];
                            return Card(
                              child: InkWell(
                                onTap: () {
                                  context.router.pop(exercise.name);
                                },
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  tileColor: MyColors.darkGrey,
                                  title: Text(
                                    exercise.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,

                                    style: TextStyle(
                                      color: MyColors.whiteText,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  subtitle: Text(
                                    exercise.equipment,
                                    style: TextStyle(color: MyColors.greyText),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_right,
                                    color: MyColors.whiteText,
                                    size: 25.r,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: exerciseTitles.length,
              ),
    );
  }
}
