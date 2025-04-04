import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/workout_model.dart';
import 'package:fitlifts/data/models/history_data_model.dart';
import 'package:fitlifts/data/models/step_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/history/providers/graph_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryDataProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _gotInitalData = false;
  bool get gotInitialData => _gotInitalData;

  List<HistoryDataModel> _historyDataList = [];
  List<HistoryDataModel> get historyDataList => _historyDataList;

  String? _currentDropdownValue;
  String? get currentDropdownValue => _currentDropdownValue;

  void updateSort(String? value) {
    _currentDropdownValue = value;
    getHistoryData();
    notifyListeners();
  }

  Future<void> getHistoryData() async {
    _gotInitalData = false;
    _isLoading = true;

    notifyListeners();
    try {
      List<WorkoutModel> workoutsList = await DBHelper().getAllWorkout(false);
      List<StepModel> stepsList = await DBHelper().getAllSteps(false);

      Map<String, HistoryDataModel> historyMap = {};
      String? formattedDate;

      for (var workout in workoutsList) {
        formattedDate = formatDate(workout.date);

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
        formattedDate = formatDate(step.date);

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
      if (_currentDropdownValue == "oldest") {
        _historyDataList =
            historyMap.values.toList()..sort(
              (a, b) => DateFormat("d MMM, yyyy")
                  .parse(a.date)
                  .compareTo(DateFormat("d MMM, yyyy").parse(b.date)),
            );
      } else {
        _historyDataList =
            historyMap.values.toList()..sort(
              (a, b) => DateFormat("d MMM, yyyy")
                  .parse(b.date)
                  .compareTo(DateFormat("d MMM, yyyy").parse(a.date)),
            );
      }

      _isLoading = false;
      _gotInitalData = true;
      notifyListeners();
    } catch (e) {
      _gotInitalData = true;
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

  Future<void> refresh(BuildContext context) async {
    if (Provider.of<GraphProvider>(context, listen: false).gotInitialData &&
        _gotInitalData) {
      Provider.of<GraphProvider>(context, listen: false).getWeekSteps();
      getHistoryData();
    }
    await Future.delayed(const Duration(seconds: 1));
    Utils.showCustomToast("Data refreshed successfully.");
  }
}
