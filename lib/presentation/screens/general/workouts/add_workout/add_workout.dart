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
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10, 25),
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
                      suffix: Text("Kg"),
                    ),
                    SizedBox(height: 20.h),
                    DateTimeWidget(showDate: false),
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
                          exerciseName,
                          repsController.text.toString(),
                          weightController.text.toString(),

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
