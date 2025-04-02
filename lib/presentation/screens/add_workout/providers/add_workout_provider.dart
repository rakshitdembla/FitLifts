import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/workout_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AddWorkoutProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> insertWorkout(
    WorkoutModel workoutModel,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await DBHelper().insertWorkout(workoutModel);
      Utils.showCustomToast("Workout Saved Successfully!");
      if (context.mounted) {
        context.router.pop();
      }
    } catch (e) {
      Utils.showCustomToast("An error occured!");
    }

    _isLoading = false;
    notifyListeners();
  }
}
