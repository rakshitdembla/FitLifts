import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/arms_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/back_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/cardio_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/chest_exercises.dart';
import 'package:fitlifts/data/data_source/local/exercises%20database/shoulder_exercises.dart';
import 'package:fitlifts/data/models/exercise.dart';
import 'package:flutter/widgets.dart';
import '../../../../../data/data_source/local/exercises database/abs_exercises.dart';
import '../../../../../data/data_source/local/exercises database/legs_exercises.dart';

class AddCustomExerciseProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _dropdownValue;
  String? get dropdownValue => _dropdownValue;

  List<String> options = ["Home Workout", "Gym Workout"];

  String? _selectedRadio = "Home Workout";
  String? get selectedRadio => _selectedRadio;

  Future<void> addExercise(Exercise exercise, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    if (_dropdownValue == "Abs") {
      absExercises.add(exercise);
    } else if (_dropdownValue == "Legs") {
      legExercises.add(exercise);
    } else if (_dropdownValue == "Shoulder") {
      shoulderExercises.add(exercise);
    } else if (_dropdownValue == "Chest") {
      chestExercises.add(exercise);
    } else if (_dropdownValue == "Cardio") {
      cardioExercises.add(exercise);
    } else if (_dropdownValue == "Back") {
      backExercises.add(exercise);
    } else if (_dropdownValue == "Arms") {
      armsExercises.add(exercise);
    } else {
      Utils.showCustomToast("Please select a target muscle group");
      _isLoading = false;
      notifyListeners();
      return;
    }

    Utils.showCustomToast("Exercise added successfully!");
    if (context.mounted) {
      context.router.pop();
    }
    _isLoading = false;
    _dropdownValue = null;
    notifyListeners();
  }

  void updateDropdown(String? value) {
    _dropdownValue = value;
    notifyListeners();
  }

  void updateRadio(String? value) {
    _selectedRadio = value;
    notifyListeners();
  }
}
