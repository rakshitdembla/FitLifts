import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/workouts_list/fetch_all_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/my_colors.dart';
import '../../../../../../data/models/exercise.dart';

@RoutePage()
class WorkoutsList extends StatefulWidget {
  const WorkoutsList({super.key});

  @override
  State<WorkoutsList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  bool isListFetched = false;
  @override
  void didChangeDependencies() {
    if (!isListFetched) {
      isListFetched = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<LocalExercisesProvider>(context, listen: false).getWorkouts();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalExercisesProvider>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: MyColors.primaryCharcoal,
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: IconButton(
                  onPressed: () {
                    context.router.push(
                      SearchExerciseRoute(allExercises: state.allExercises),
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
              state.isLoading
                  ? Center(
                    child: CircularProgressIndicator(color: MyColors.whiteText),
                  )
                  : ListView.builder(
                    itemBuilder: (context, index) {
                      String exerciseTitle = state.exerciseTitles[index];
                      List<Exercise> exercisesList = state.allExercises[index];
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
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
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
                                        style: TextStyle(
                                          color: MyColors.greyText,
                                        ),
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
                    itemCount: state.exerciseTitles.length,
                  ),
        );
      },
    );
  }
}
