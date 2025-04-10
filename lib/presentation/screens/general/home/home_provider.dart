import 'dart:async';
import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/data/models/step_model.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/check_permission.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/fetch_toady_stepsdata.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/fetch_today_workout.dart';
import 'package:fitlifts/presentation/screens/general/home/isolates/save_steps.dart';
import 'package:fitlifts/services/providers/user_initial_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/my_strings.dart';
import '../../../../services/local_storage_utils.dart';

class HomeProvider with ChangeNotifier {
  // Tracking and error state
  bool _isTracking = false;
  bool get isTracking => _isTracking;

  bool _isError = false;
  bool get isError => _isError;

  // Step tracking
  int _steps = 0; // Current session
  int get steps => _steps;

  int _totalSteps = 0; // Device total
  int _dbSteps = 0; // From DB
  int get dbSteps => _dbSteps;

  // Fitness metrics
  double _calories = 0.0;
  double get calories => _calories;

  double _distance = 0.0;
  double get distance => _distance;

  double _workoutVolume = 0.0;
  double get workoutVolume => _workoutVolume;

  // User info
  String? _profileImage;
  String? get profileImage => _profileImage;

  String? _userName;
  String? get userName => _userName;

  // Data load states
  bool _gotInitialData = true;
  bool get gotInitialData => _gotInitialData;

  bool _stopTrackingSuccess = true;
  bool get stopTrackingSuccess => _stopTrackingSuccess;

  // Step count stream
  StreamSubscription<StepCount>? _stepsSubscription;
  StreamSubscription<StepCount>? get stepsSubscription => _stepsSubscription;

  // Body weight
  double? _getBodyWeight;

  /// Loads today's step, workout, and profile
  Future<void> getInitialData(BuildContext context) async {
    _gotInitialData = false;
    _isError = false;
    _isTracking = false;
    notifyListeners();

    UserInitialDetailsProvider userInitialDetailsProvider =
        Provider.of<UserInitialDetailsProvider>(context, listen: false);

    // Call check premium
    await userInitialDetailsProvider.getUserDetails();

    // Get user data
    _getBodyWeight = userInitialDetailsProvider.bodyWeight ?? 70.00;
    _profileImage = userInitialDetailsProvider.profileUrl;
    _userName = userInitialDetailsProvider.userName;
    notifyListeners();

    await getTodayData();

    _gotInitialData = true;
    notifyListeners();
  }

  Future<void> getTodayData() async {
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
      return;
    }

    _workoutVolume = getWorkoutData as double;
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

    // Fetch db steps
    _dbSteps = await LocalStorageUtils.getLastSteps();
    // Check permissions first
    final checkPermission = await CheckPermissionIsolate.check();
    debugPrint("checking permission -1");
    if (checkPermission == false) {
      Utils.showCustomToast(
        "Please allow activity tracking permission from settings to count your steps.",
      );
      await Future.delayed(const Duration(milliseconds: 300));
      await Permission.activityRecognition.request();
      _isTracking = false;
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
        (StepCount event) async {
          _isTracking = true;
          final newSteps = event.steps;
          _totalSteps = event.steps;

          if (newSteps < _dbSteps) {
            // Handle case where step count resets (device restart)
            _steps = newSteps;
          } else if (_dbSteps == 0 && newSteps > 15) {
            // Handle app reinstall
            await LocalStorageUtils.saveLastSteps(newSteps);
            _dbSteps = await LocalStorageUtils.getLastSteps();
            _steps = 0;
          } else {
            // Normal case - subtract previously stored steps
            _steps = newSteps - dbSteps;
          }

          // Update derived metrics
          _distance = _steps * 0.762;
          _calories = (_steps * _getBodyWeight! * 0.57) / 1000;
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
    Utils.showCustomToast("Saving your session and stopping tracking…");

    // Save steps if we have valid data
    if (_dbSteps > 0) {
      await LocalStorageUtils.saveLastSteps(_dbSteps);
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
    await getTodayData();

    if (stepsResult == false) {
      Utils.showCustomToast("Step data wasn't saved. We'll try again shortly.");
    }

    // Clean up subscription
    _stepsSubscription?.cancel();
    _stepsSubscription = null;

    // Refresh data
    _stopTrackingSuccess = true;
  }

  /// Refreshes all data manually
  Future<void> refreshData(BuildContext context) async {
    getInitialData(context);
    await Future.delayed(const Duration(seconds: 1));
    Utils.showCustomToast("All set! Your data has been refreshed.");
  }
}
