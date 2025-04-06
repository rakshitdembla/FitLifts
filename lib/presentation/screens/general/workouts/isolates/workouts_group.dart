import 'dart:async';
import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../../../data/models/workout_model.dart';

class GroupWorkoutsIsolate {
  static Future<Map<String, List<WorkoutModel>>> groupWorkouts(
    List<WorkoutModel> workouts,
  ) async {
    ReceivePort receivePort = ReceivePort();
    Completer<Map<String, List<WorkoutModel>>> completer =
        Completer<Map<String, List<WorkoutModel>>>();
    Isolate isolate = await Isolate.spawn(
      _groupIsolation,
      _IsolateData(
        token: RootIsolateToken.instance!,
        answerPort: receivePort.sendPort,
        workouts: workouts,
      ),
    );

    receivePort.listen((message) {
      receivePort.close();
      isolate.kill();
      completer.complete(message as Map<String, List<WorkoutModel>>);
    });
    return completer.future;
  }

  static void _groupIsolation(_IsolateData data) {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);
    Map<String, List<WorkoutModel>> groupedWorkouts = {};
    for (var workout in data.workouts) {
      final date = DateFormat("yyyy-MM-dd").format(workout.date);

      if (groupedWorkouts.containsKey(date)) {
        groupedWorkouts[date]!.add(workout);
      } else {
        groupedWorkouts[date] = [workout];
      }
    }

    for (var entry in groupedWorkouts.entries) {
      entry.value.sort((a, b) => b.date.compareTo(a.date));
    }
    data.answerPort.send(groupedWorkouts);
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort answerPort;
  final List<WorkoutModel> workouts;

  _IsolateData({
    required this.token,
    required this.answerPort,
    required this.workouts,
  });
}
