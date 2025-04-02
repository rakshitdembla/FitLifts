import 'dart:async';
import 'dart:isolate';
import 'package:fitlifts/data/models/workout_model.dart';
import 'package:flutter/services.dart';
import '../../../../../data/data_source/local/sqf database/db_helper.dart';

class FetchWorkoutsIsolate {
  static Future<List<WorkoutModel>?> getAll() async {
    ReceivePort receivePort = ReceivePort();
    Completer<List<WorkoutModel>?> completer = Completer<List<WorkoutModel>?>();
    Isolate isolate = await Isolate.spawn(
      _allworkoutsIsolate,
      _IsolateData(
        token: RootIsolateToken.instance!,
        answerPort: receivePort.sendPort,
      ),
    );

    receivePort.listen((message) {
      receivePort.close();
      isolate.kill();
      completer.complete(message);
    });

    return completer.future;
  }

  static void _allworkoutsIsolate(_IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);
    try {
      final List<WorkoutModel> workouts = await DBHelper().getAllWorkout(false);
      data.answerPort.send(workouts);
    } catch (e) {
      data.answerPort.send(null);
    }
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort answerPort;

  _IsolateData({required this.token, required this.answerPort});
}
