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
  // Tracking state
  bool _isTracking = false;
  bool get isTracking => _isTracking;

  // Error state
  bool _isError = false;
  bool get isError => _isError;

  // Step-related variables
  int _steps = 0; // Current session steps
  int get steps => _steps;

  int _totalSteps = 0; // Total steps from device (including previous sessions)

  int _dbSteps = 0; // Steps stored in database
  int get dbSteps => _dbSteps;

  // Fitness metrics
  double _calories = 0.0;
  double get calories => _calories;

  double _distance = 0.0;
  double get distance => _distance;

  double _workoutVolume = 0.0;
  double get workoutVolume => _workoutVolume;

  // User profile
  String? _profileImage;
  String? get profileImage => _profileImage;

  // Data loading states
  bool _gotInitialData = true;
  bool get gotInitialData => _gotInitialData;

  bool _stopTrackingSuccess = true;
  bool get stopTrackingSuccess => _stopTrackingSuccess;

  // Step counting subscription
  StreamSubscription<StepCount>? _stepsSubscription;
  StreamSubscription<StepCount>? get stepsSubscription => _stepsSubscription;

  // User's body weight for calorie calculation
  late double getBodyWeight;

  HomeProvider() {
    getInitialData(); // Initialize with today's data
  }

  /// Loads today's step, workout, and profile data from storage
  Future<void> getInitialData() async {
    _gotInitialData = false;
    _isError = false;
    _isTracking = false;

    // Fetch user data
    getBodyWeight = await Utils.getBodyWeight();
    _dbSteps = await Utils.getLastSteps();
    _profileImage = await Utils.getProfileImage();
    notifyListeners();

    // Get step data from isolate
    final Map<String, double> stepDataMap =
        await TodayStepDataIsolate.getSteps();
    if (stepDataMap.containsKey("error")) {
      Utils.showCustomToast(
        "We couldn't fetch your step history. Please try again!",
      );
      return;
    }

    // Update step metrics
    _steps = stepDataMap[MyStrings.steps]!.toInt();
    _calories = stepDataMap[MyStrings.calories]!;
    _distance = stepDataMap[MyStrings.distance]!;

    // Get workout data from isolate
    final getWorkoutData = await TodayWorkoutDataIsolate.getWorkoutVolume();

    if (getWorkoutData is String) {
      Utils.showCustomToast(
        "Oops! Workout data couldn't be loaded. Pull to refresh.",
      );
      _gotInitialData = true;
      return;
    }

    _workoutVolume = getWorkoutData as double;
    _gotInitialData = true;
    notifyListeners();
  }

  /// Starts tracking steps using device sensors
  Future<void> startTracking() async {
    // Reset tracking state
    _stepsSubscription?.cancel();
    _steps = 0;
    _distance = 0.0;
    _calories = 0.0;
    _isTracking = true;
    _isError = false;
    notifyListeners();

    // Check permissions first
    final checkPermission = await CheckPermissionIsolate.check();
    if (checkPermission == false) {
      Utils.showCustomToast(
        "Please allow activity tracking in settings to count your steps.",
      );
      _isTracking = false;
      _isError = true;
      notifyListeners();
      return;
    } else if (checkPermission == null) {
      Utils.showCustomToast("Permission check failed. Please try again!");
      _isError = true;
      _isTracking = false;
      notifyListeners();
      return;
    }
    Utils.showCustomToast("Step tracking started. Let's get moving!");

    try {
      // Subscribe to step count stream
      _stepsSubscription = Pedometer.stepCountStream.distinct().listen(
        (StepCount event) {
          final newSteps = event.steps;
          _totalSteps = event.steps;

          // Calculate metrics based on new steps
          if (newSteps < dbSteps) {
            // Handle case where step count resets (device restart)
            _steps = newSteps;
          } else {
            // Normal case - subtract previously stored steps
            _steps = newSteps - dbSteps;
          }

          // Update derived metrics
          _distance = _steps * 0.762; // Convert steps to distance (in meters)
          _calories =
              (_steps * getBodyWeight * 0.57) /
              1000; // Calculate calories burned
          notifyListeners();
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

  /// Stops tracking and saves the current session data
  Future<void> stopTracking() async {
    _stopTrackingSuccess = false;
    _dbSteps = _totalSteps;
    _isError = false;
    _isTracking = false;
    notifyListeners();

    // Save steps if we have valid data
    if (dbSteps > 0) {
      await Utils.saveLastSteps(_dbSteps);
    }

    // Save step data through isolate
    final stepsResult = await SaveStepsIsolate.saveSteps(
      StepModel(
        date: DateTime.now(),
        stepCount: _steps,
        distance: _distance,
        calories: _calories,
      ),
    );

    if (stepsResult == false) {
      Utils.showCustomToast("Step data wasn't saved. We'll try again shortly.");
    }

    // Clean up subscription
    _stepsSubscription?.cancel();
    _stepsSubscription = null;

    // Refresh data
    getInitialData();

    _stopTrackingSuccess = true;
  }

  /// Refreshes all data manually
  Future<void> refreshData() async {
    getInitialData();
    await Future.delayed(const Duration(seconds: 1));
    Utils.showCustomToast("All set! Your data has been refreshed.");
  }
}
