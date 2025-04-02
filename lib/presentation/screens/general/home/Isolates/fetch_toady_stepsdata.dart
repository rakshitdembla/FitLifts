import 'dart:async';
import 'dart:isolate';
import 'package:flutter/services.dart';
import '../../../../../data/data_source/local/sqf database/db_helper.dart';

class TodayStepDataIsolate {
  static Future<Map<String, double>> getSteps() async {
    ReceivePort receivePort = ReceivePort();
    Completer<Map<String, double>> completer = Completer<Map<String, double>>();
    Isolate isolate = await Isolate.spawn(
      _getStepsIsolate,
      _IsolateData(
        token: RootIsolateToken.instance!,
        answerPort: receivePort.sendPort,
      ),
    );

    receivePort.listen((message) {
      receivePort.close();
      isolate.kill();
      completer.complete(message as Map<String, double>);
    });

    return completer.future;
  }

  static void _getStepsIsolate(_IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);
    try {
      Map<String, double> stepDataMap =
          await DBHelper().getTotalStepsForToday();
      data.answerPort.send(stepDataMap);
    } catch (e) {
      data.answerPort.send({"error": 0.0});
    }
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort answerPort;

  _IsolateData({required this.token, required this.answerPort});
}
