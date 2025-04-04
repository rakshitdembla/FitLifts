part of "add_custom_exercise_imports.dart";

@RoutePage()
class AddCustomExercise extends StatefulWidget {
  const AddCustomExercise({super.key});

  @override
  State<AddCustomExercise> createState() => _AddCustomExerciseState();
}

class _AddCustomExerciseState extends State<AddCustomExercise> {
  TextEditingController exerciseNameController = TextEditingController();
  FocusNode exerciseNameNode = FocusNode();

  TextEditingController instructionsController = TextEditingController();
  FocusNode instructionsNode = FocusNode();

  TextEditingController equipmentsController = TextEditingController();
  FocusNode equipmentsNode = FocusNode();

  TextEditingController mistakesController = TextEditingController();
  FocusNode mistakesNode = FocusNode();

  @override
  void dispose() {
    exerciseNameController.dispose();
    exerciseNameNode.dispose();

    instructionsController.dispose();
    instructionsNode.dispose();

    equipmentsController.dispose();
    equipmentsNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Exercise',
          style: TextStyle(color: MyColors.whiteText),
        ),
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),
      body: Consumer<AddCustomExerciseProvider>(
        builder: (context, state, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
            child: Column(
              children: [
                CustomDropDown(
                  style: GoogleFonts.poppins(
                    color: MyColors.greyText,
                    fontSize: 18.sp,
                  ),
                  hintText: "Targeted Muscle",
                  items: [
                    DropdownMenuItem(value: "Abs", child: Text("Abs")),
                    DropdownMenuItem(value: "Legs", child: Text("Legs")),
                    DropdownMenuItem(
                      value: "Shoulder",
                      child: Text("Shoulder"),
                    ),
                    DropdownMenuItem(value: "Chest", child: Text("Chest")),
                    DropdownMenuItem(value: "Cardio", child: Text("Cardio")),
                    DropdownMenuItem(value: "Back", child: Text("Back")),
                    DropdownMenuItem(value: "Arms", child: Text("Arms")),
                  ],

                  onChanged: (value) {
                    state.updateDropdown(value);
                  },
                  value: state.dropdownValue,
                  isExpanded: true,
                ),
                SizedBox(height: 20.h),
                ExerciseTextField(
                  controller: exerciseNameController,
                  focusNode: exerciseNameNode,
                  hinttext: 'Exercise Name',
                  maxLength: 40,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(equipmentsNode);
                  },
                ),
                SizedBox(height: 20.h),
                ExerciseTextField(
                  controller: equipmentsController,
                  focusNode: equipmentsNode,
                  hinttext: 'Equipments Required (optional)',
                  maxLength: 40,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(instructionsNode);
                  },
                ),
                SizedBox(height: 20.h),
                ExerciseTextField(
                  controller: instructionsController,
                  isMultiline: true,
                  focusNode: instructionsNode,
                  hinttext: 'Exercise Instructions (optional)',
                  maxLength: 200,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(mistakesNode);
                  },
                ),
                SizedBox(height: 20.h),

                ExerciseTextField(
                  controller: mistakesController,
                  isMultiline: true,
                  focusNode: mistakesNode,
                  hinttext: 'Common mistakes (optional)',
                  maxLength: 200,
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                SizedBox(height: 20.h),

                Row(
                  children: [
                    for (var option in state.options)
                      Flexible(
                        child: Row(
                          children: [
                            Radio(
                              value: option,
                              groupValue: state.selectedRadio,
                              activeColor: Colors.blue,
                              onChanged: (value) => state.updateRadio(value),
                              visualDensity: VisualDensity(
                                horizontal: -4.0,
                                vertical: -4.0,
                              ),
                            ),
                            Text(
                              option,
                              style: TextStyle(color: MyColors.whiteText),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 20.h),

                state.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedCTA(
                      title: "Add Exercise",
                      onPressed: () {
                        if (exerciseNameController.text.isEmpty) {
                          Utils.showCustomToast("Exercise name is mandatory");
                          return;
                        } else if (state.dropdownValue == null) {
                          Utils.showCustomToast(
                            "Please select targetted muscle",
                          );
                          return;
                        }
                        state.addExercise(
                          Exercise(
                            name: exerciseNameController.text.trim(),
                            targetMuscle: state.dropdownValue!,
                            secondaryMuscles: [],
                            equipment: equipmentsController.text.toString(),
                            instructions:
                                instructionsController.text.toString(),
                            commonMistakes: mistakesController.text.toString(),
                            setsAndReps: "",
                            homeWorkout:
                                state.selectedRadio == "Home Workout"
                                    ? true
                                    : false,
                          ),
                        );
                      },
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
