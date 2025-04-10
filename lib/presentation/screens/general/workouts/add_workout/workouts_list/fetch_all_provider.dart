import 'package:flutter/widgets.dart';
import '../../../../../../data/data_source/local/exercises database/abs_exercises.dart';
import '../../../../../../data/data_source/local/exercises database/arms_exercises.dart';
import '../../../../../../data/data_source/local/exercises database/back_exercises.dart';
import '../../../../../../data/data_source/local/exercises database/cardio_exercises.dart';
import '../../../../../../data/data_source/local/exercises database/chest_exercises.dart';
import '../../../../../../data/data_source/local/exercises database/legs_exercises.dart';
import '../../../../../../data/data_source/local/exercises database/shoulder_exercises.dart';
import '../../../../../../data/models/exercise.dart';

class LocalExercisesProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<List<Exercise>> _allExercises = [];
  List<List<Exercise>> get allExercises => _allExercises;
  final List<String> _exerciseTitles = [];
  List<String> get exerciseTitles => _exerciseTitles;

  void getWorkouts() async{
    _isLoading = true;
    notifyListeners();
    _allExercises.clear();
    _allExercises.addAll([
      absExercises,
      armsExercises,
      backExercises,
      cardioExercises,
      chestExercises,
      legExercises,
      shoulderExercises,
    ]);

    _exerciseTitles.clear();
    _exerciseTitles.addAll([
      "Abs",
      "Arms",
      "Back",
      "Cardio",
      "Chest",
      "Legs",
      "Shoulder",
    ]);
        await Future.delayed(Duration(milliseconds: 700));
    _isLoading = false;
    notifyListeners();
  }
}
