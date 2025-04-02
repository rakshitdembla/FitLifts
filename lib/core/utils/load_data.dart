import 'package:fitlifts/data/data_source/local/exercises%20database/abs_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/back_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/cardio_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/chest_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/legs_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/shoulder_exercises.dart';
import 'package:fitlifts/data/models/exercise.dart';
import '../../data/data_source/local/exercises database/arms_exercises.dart';

class UtilsLoadData {
  static void allExercisesList(
    List<List<Exercise>> allExercises,
    List<String> exerciseTitles,
  ) {
    allExercises.clear();
    allExercises.addAll([
      absExercises,
      armsExercises,
      backExercises,
      cardioExercises,
      chestExercises,
      legExercises,
      shoulderExercises,
    ]);

    exerciseTitles.clear();
    exerciseTitles.addAll([
      "Abs",
      "Arms",
      "Back",
      "Cardio",
      "Chest",
      "Legs",
      "Shoulder",
    ]);
  }

  // static Future<void> getUserWorkouts(
  //   Map<String, List<WorkoutModel>> groupedWorkouts,
  //   List<WorkoutModel> workouts,
  //   DBHelper dbhelper,
  // ) async {
  //   List<WorkoutModel> getWorkouts = await dbhelper.getAllWorkout(false);
  //   debugPrint("- Initial workouts: $getWorkouts");

  //   groupedWorkouts.clear();

  //   if (getWorkouts.isEmpty) {
  //     debugPrint("No workouts found");

  //     return;
  //   }
  //   for (final workout in getWorkouts) {
  //     final date = DateFormat("yyyy-MM-dd").format(workout.date);
  //     debugPrint("Processing workout for date: $date");

  //     if (groupedWorkouts.containsKey(date)) {
  //       groupedWorkouts[date]!.add(workout);
  //       debugPrint("Added to existing date group: ${groupedWorkouts[date]}");
  //     } else {
  //       groupedWorkouts[date] = [workout];
  //       debugPrint("Created new date group: ${groupedWorkouts[date]}");
  //     }
  //   }

  //   debugPrint("- Final grouped workouts: $groupedWorkouts");
  // }
}
