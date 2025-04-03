import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/workouts/isolates/fetch_workouts.dart';
import 'package:fitlifts/presentation/screens/general/workouts/isolates/workouts_group.dart';
import 'package:flutter/widgets.dart';
import '../../../../data/models/workout_model.dart';

class FetchWorkoutsProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;
  bool _noDataAvailable = false;
  bool get noDataAvailable => _noDataAvailable;

  List<WorkoutModel> _workouts = [];
  Map<String, List<WorkoutModel>> _groupedWorkouts = {};

  List<MapEntry<String, List<WorkoutModel>>> _groupedList = [];
  List<MapEntry<String, List<WorkoutModel>>> get groupedList => _groupedList;

  bool _gotInitialData = false;


  Future<void> getWorkouts() async {
    _isLoading = true;
    _isError = false;
    _noDataAvailable = false;
    notifyListeners();

    final List<WorkoutModel>? getAllWorkout =
        await FetchWorkoutsIsolate.getAll();
    if (getAllWorkout == null) {
      _isLoading = false;
      _isError = true;
       _gotInitialData = true;
      notifyListeners();    
      return;
    } else if (getAllWorkout.isEmpty) {
      _isLoading = false;
      _noDataAvailable = true;
        _gotInitialData = true;
      notifyListeners();
      return;
    } else {
      _workouts = getAllWorkout;
    }

    _groupedWorkouts = await GroupWorkoutsIsolate.groupWorkouts(_workouts);
    _groupedList = _groupedWorkouts.entries.toList();

    _isLoading = false;
    _gotInitialData = true;
    notifyListeners();
  }

  Future<void> refreshWorkouts() async{
    if (_gotInitialData) {
      getWorkouts();
    }
     await Future.delayed(const Duration(seconds: 1));
     Utils.showCustomToast("Workouts refreshed successfully.");
  }
}
