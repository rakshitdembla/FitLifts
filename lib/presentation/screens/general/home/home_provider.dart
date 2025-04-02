import 'dart:async';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/data/models/step_model.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/check_permission.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/fetch_toady_stepsdata.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/fetch_today_workout.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/save_steps.dart';
import 'package:flutter/foundation.dart';
import 'package:pedometer/pedometer.dart';
import '../../../../core/constants/my_strings.dart';

class HomeProvider with ChangeNotifier {
  bool _isTracking = false;
  bool get isTracking => _isTracking;

  bool _isError = false;
  bool get isError => _isError;

  int _steps = 0;
  int get steps => _steps;

  int _dbSteps = 0;
  int get dbSteps => _dbSteps;

  double _calories = 0.0;
  double get calories => _calories;

  double _distance = 0.0;
  double get distance => _distance;

  double _workoutVolume = 0.0;
  double get workoutVolume => _workoutVolume;

  bool _gotInitialData = false;
  StreamSubscription<StepCount>? _stepsSubscription;
  StreamSubscription<StepCount>? get stepsSubscription => _stepsSubscription;
  late double getBodyWeight;
  HomeProvider() {
    getInitialData();
  }

  //-- Load Today's Data
  Future<void> getInitialData() async {
    _isError = false;
    _isTracking = false;
    getBodyWeight = await Utils.getBodyWeight();
    _dbSteps = await Utils.getLastSteps();
    _gotInitialData = true;

    final Map<String, double> stepDataMap =
        await TodayStepDataIsolate.getSteps();
    if (stepDataMap.containsKey("error")) {
      Utils.showCustomToast(
        "Failed to load your step history. Please check your connection and try again.",
      );
      return;
    }
    _steps = stepDataMap[MyStrings.steps]!.toInt();
    _calories = stepDataMap[MyStrings.calories]!;
    _distance = stepDataMap[MyStrings.distance]!;

    final getWorkoutData = await TodayWorkoutDataIsolate.getWorkoutVolume();

    if (getWorkoutData is String) {
      Utils.showCustomToast(
        "Couldn't load your workout data. Please refresh to try again.",
      );
      return;
    }

    _workoutVolume = getWorkoutData as double;
    notifyListeners();
  }

  //-- On Start Tracking Event
  Future<void> startTracking() async {
    if (!_gotInitialData) {
      Utils.showCustomToast("Please wait while we save your previous session.");
      return;
    }
    Utils.showCustomToast("Starting step tracking...");
    _isTracking = true;
    _isError = false;

    final checkPermission = await CheckPermissionIsolate.check();
    if (checkPermission == false) {
      Utils.showCustomToast(
        "Please enable activity tracking permissions in settings to count your steps.",
      );
      return;
    } else if (checkPermission == null) {
      Utils.showCustomToast("Unable to verify permissions. Please try again.");
      _isError = true;
      _isTracking = false;
      notifyListeners();
      return;
    }

    _stepsSubscription?.cancel();
    _steps = 0;
    _distance = 0.0;
    _calories = 0.0;
    notifyListeners();

    try {
      _stepsSubscription = Pedometer.stepCountStream.distinct().listen(
        (StepCount event) {
          final newSteps = event.steps;
          final stepsDifference = newSteps - _steps;

          if (stepsDifference >= 5) {
            if (newSteps < dbSteps) {
              _steps = newSteps;
              _distance = _steps * 0.762;
              _calories = (_steps * getBodyWeight * 0.57) / 1000;
            } else {
              _steps = newSteps - dbSteps;
              _distance = _steps * 0.762;
              _calories = (_steps * getBodyWeight * 0.57) / 1000;
            }
          }
          notifyListeners();
          _dbSteps = newSteps;
        },
        onError: (error) {
          _isError = true;
          _isTracking = false;
          Utils.showCustomToast(
            "Step tracking failed. Make sure your device supports step counting and try again.",
          );
          notifyListeners();
        },
      );
    } catch (e) {
      _isError = true;
      _isTracking = false;
      Utils.showCustomToast(
        "Failed to start step tracking. Please check your device compatibility.",
      );
      notifyListeners();
    }
  }

  //-- On Stop Tracking Event
  Future<void> stopTracking() async {
    _gotInitialData = false;
    _isError = false;
    _isTracking = false;
    notifyListeners();

    if (dbSteps > 0) {
      await Utils.saveLastSteps(_dbSteps);
    }

    final stepsResult = await SaveStepsIsolate.saveSteps(
      StepModel(
        date: DateTime.now(),
        stepCount: _steps,
        distance: _distance,
        calories: _calories,
      ),
    );

    if (stepsResult == false) {
      Utils.showCustomToast(
        "Couldn't save your step data. Don't worry, we'll try again later.",
      );
    }

    _stepsSubscription?.cancel();
    _stepsSubscription = null;

    getInitialData();
  }

  Future<void> refreshData() async {
    if (_gotInitialData) {
      getInitialData();
    }
        await Future.delayed(const Duration(seconds: 1));
  }
}
