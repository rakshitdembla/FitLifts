import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/workout_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';

class AddWorkoutProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> insertWorkout(
    String? exerciseName,
    String reps,
    String liftedWeight,
    BuildContext context,
  ) async {
    _isLoading = true;
    double bodyWeight = await Utils.getBodyWeight();
    notifyListeners();

    if (exerciseName == null) {
      _isLoading = false;
      Utils.showCustomToast("Please select an exercise.");
      return;
    }

    int? parsedReps = int.tryParse(reps);
    double? parsedLiftedWeight = double.tryParse(liftedWeight) ?? bodyWeight;

    if (parsedReps == null || parsedReps > 999) {
      _isLoading = false;
      Utils.showCustomToast("Please enter valid repetitions");
      return;
    }

    if (parsedLiftedWeight > 1000.00) {
      _isLoading = false;
      Utils.showCustomToast("Are you hulk? obviously not");
      return;
    }

    double volume = parsedReps * parsedLiftedWeight;
    double caloriesBurned = Utils.calculateWorkoutCalories(
      bodyWeight,
      parsedReps,
      parsedLiftedWeight,
    );

    try {
      await DBHelper().insertWorkout(
        WorkoutModel(
          date: DateTime.now(),
          exerciseName: exerciseName,
          reps: parsedReps,
          weight: parsedLiftedWeight,
          volume: volume,
          caloriesBurned: caloriesBurned,
        ),
      );
      Utils.showCustomToast("Workout Saved Successfully!");

      if (context.mounted) {
        context.router.push(GeneralRoute());
      }
    } catch (e) {
      Utils.showCustomToast("An error occured!");
    }

    _isLoading = false;
    notifyListeners();
  }
}
