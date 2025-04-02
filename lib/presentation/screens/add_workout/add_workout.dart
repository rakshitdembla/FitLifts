part of 'add_workout_imports.dart';

@RoutePage()
class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  TextEditingController repsController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? exerciseName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
        title: Text(
          "Add Workout",
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
        child: Column(
          children: [
            Card(
              child: InkWell(
                onTap: () async {
                  String? getExerciseName = await Utils.selectExerciseNav(
                    context,
                  );
                  if (getExerciseName != null) {
                    setState(() {
                      exerciseName = getExerciseName;
                    });
                  }
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  tileColor: MyColors.darkGrey,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 7.5.w,
                  ),
                  title: Text(
                    exerciseName == null
                        ? "Select an exercise"
                        : exerciseName.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: MyColors.whiteText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: MyColors.whiteText,
                    size: 25.r,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumField(
                      maxLength: 4,
                      controller: repsController,
                      hintText: "No. of reps",
                      labelTitle: "Repetitions",
                    ),
                    SizedBox(height: 15.h),
                    NumField(
                      maxLength: 7,
                      controller: weightController,
                      hintText: "Lifted weight",
                      labelTitle: "Weight",
                    ),
                    SizedBox(height: 20.h),
                    DateTimeWidget(showDate: true),
                  ],
                ),
              ),
            ),
            Consumer<AddWorkoutProvider>(
              builder: (context, addWorkoutProvider, child) {
                return addWorkoutProvider.isLoading
                    ? Center(
                      child: LoadingAnimationWidget.waveDots(
                        color: MyColors.whiteText,
                        size: 40.r,
                      ),
                    )
                    : ElevatedCTA(
                      title: "Save",
                      onPressed: () {
                        addWorkoutProvider.insertWorkout(
                          WorkoutModel(
                            date: DateTime.now(),
                            exerciseName: exerciseName.toString(),
                            reps: int.tryParse(repsController.text) ?? 0,
                            weight:
                                double.tryParse(weightController.text) ?? 0.0,
                            volume:
                                (int.tryParse(repsController.text) ?? 0) *
                                (double.tryParse(weightController.text) ?? 0.0),
                            caloriesBurned: Utils.calculateWorkoutCalories(
                              77,
                              int.tryParse(repsController.text) ?? 0,
                              double.tryParse(weightController.text) ?? 0.0,
                            ),
                          ),
                          context,
                        );
                      },
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
