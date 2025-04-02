import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/workout_model.dart';
import 'package:fitlifts/data/models/history_data_model.dart';
import 'package:fitlifts/data/models/step_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HistoryDataProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool isReversed = false;

  List<HistoryDataModel> _historyDataList = [];
  List<HistoryDataModel> get historyDataList => _historyDataList;

  Future<void> getHistoryData() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<WorkoutModel> workoutsList = await DBHelper().getAllWorkout(true);
      List<StepModel> stepsList = await DBHelper().getAllSteps(true);

      Map<String, HistoryDataModel> historyMap = {}; //1

      for (var workout in workoutsList) {
        String formattedDate = formatDate(workout.date);

        if (!historyMap.containsKey(formattedDate)) {
          historyMap[formattedDate] = HistoryDataModel(
            date: formattedDate,
            day: getDayFromDate(workout.date),
            steps: 0,
            distance: 0.0,
            stepsCalories: 0.0,
            workoutVolume: 0.0,
            workoutCalories: 0.0,
          );
        }

        historyMap[formattedDate] = historyMap[formattedDate]!.copyWith(
          workoutVolume:
              historyMap[formattedDate]!.workoutVolume + workout.volume,
          workoutCalories:
              historyMap[formattedDate]!.workoutCalories +
              workout.caloriesBurned,
        );
      }

      for (var step in stepsList) {
        String formattedDate = formatDate(step.date);

        if (!historyMap.containsKey(formattedDate)) {
          historyMap[formattedDate] = HistoryDataModel(
            date: formattedDate,
            day: getDayFromDate(step.date),
            steps: 0,
            distance: 0.0,
            stepsCalories: 0.0,
            workoutVolume: 0.0,
            workoutCalories: 0.0,
          );
        }

        historyMap[formattedDate] = historyMap[formattedDate]!.copyWith(
          steps: historyMap[formattedDate]!.steps + step.stepCount,
          distance: historyMap[formattedDate]!.distance + step.distance,
          stepsCalories:
              historyMap[formattedDate]!.stepsCalories + step.calories,
        );
      }

      _historyDataList =
          historyMap.values.toList()..sort(
            (a, b) => DateFormat(
              "d MMM, yyyy",
            ).parse(a.date).compareTo(DateFormat("d MMM, yyyy").parse(b.date)),
          );

      if (isReversed) {
        _historyDataList = _historyDataList.reversed.toList();
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      Utils.showCustomToast("An error occured in fetching data");
    }
  }

  String formatDate(DateTime date) {
    return DateFormat("d MMM, yyyy").format(date);
  }

  String getDayFromDate(DateTime date) {
    return DateFormat("EEEE").format(date);
  }
}
