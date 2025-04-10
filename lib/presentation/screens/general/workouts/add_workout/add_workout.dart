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
    return Hero(
      tag: "addworkout_hero",
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
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
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        
                        String? getExerciseName = await Utils.selectExerciseNav(
                          context,
                        );
                        if (getExerciseName != null && context.mounted) {
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
                  Padding(
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
                        SizedBox(height: 20.h),
                        Text(
                          "*If lifted weight is left empty, your body weight will be used for exercises like push-ups and planks.",
                          style: TextStyle(
                            color: MyColors.greyText,
                            fontSize: 11.5.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Consumer<AddWorkoutProvider>(
            builder: (context, addWorkoutProvider, child) {
              return addWorkoutProvider.isLoading
                  ? Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
                      top: 10.h,
                    ),
                    child: CircularProgressLoading(),
                  )
                  : Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
                      top: 10.h,
                    ),
                    child: ElevatedCTA(
                      title: "Save",
                      onPressed: () {
                        addWorkoutProvider.insertWorkout(
                          exerciseName,
                          repsController.text.toString(),
                          weightController.text.toString(),
                          context,
                          repsController,
                          weightController,
                        );
                      },
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
