import 'dart:async';
import 'dart:isolate';
import 'package:flutter/services.dart';
import '../../../../../data/data_source/local/sqf database/db_helper.dart';

class TodayWorkoutDataIsolate {
  static Future<dynamic> getWorkoutVolume() async {
    ReceivePort receivePort = ReceivePort();
    Completer<dynamic> completer = Completer<dynamic>();
    Isolate isolate = await Isolate.spawn(
      _getWorkoutIsolate,
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

  static void _getWorkoutIsolate(_IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);
    try {
      double workoutData =
          await DBHelper().getTotalWorkoutVolumeForToday();
      data.answerPort.send(workoutData);
    } catch (e) {
      data.answerPort.send(e.toString());
    }
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort answerPort;

  _IsolateData({required this.token, required this.answerPort});
}
