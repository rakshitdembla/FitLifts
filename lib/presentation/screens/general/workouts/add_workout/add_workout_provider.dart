import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/workout_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/workouts/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddWorkoutProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> insertWorkout(
    String? exerciseName,
    String reps,
    String liftedWeight,
    BuildContext context,
    TextEditingController repsController,
    TextEditingController weightController,
  ) async {
    _isLoading = true;
    double bodyWeight = await Utils.getBodyWeight();
    notifyListeners();

    if (exerciseName == null) {
      _isLoading = false;
      Utils.showCustomToast("Pick an exercise first!");
      notifyListeners();
      return;
    }

    int? parsedReps = int.tryParse(reps);
    double? parsedLiftedWeight = double.tryParse(liftedWeight) ?? bodyWeight;

    if (parsedReps == null || parsedReps > 999) {
      _isLoading = false;
      Utils.showCustomToast("Double-check those reps!");
      notifyListeners();
      return;
    }

    if (parsedLiftedWeight > 1000.00) {
      _isLoading = false;
      Utils.showCustomToast("Whoa, that's heavy! Try a realistic weight.");
      notifyListeners();
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
      clearControllers(repsController, weightController);
      if (context.mounted) {
        await Provider.of<FetchWorkoutsProvider>(
          context,
          listen: false,
        ).getWorkouts();
        if (context.mounted) {
          context.router.pop();
        }
      }
    } catch (e) {
      Utils.showCustomToast("Something went wrong. Try again!");
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearControllers(
    TextEditingController repsController,
    TextEditingController weightController,
  ) {
    repsController.clear();
    weightController.clear();
  }
}
