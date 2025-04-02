import 'dart:async';
import 'dart:isolate';
import 'package:fitlifts/data/models/step_model.dart';
import 'package:flutter/services.dart';
import '../../../../../data/data_source/local/sqf database/db_helper.dart';

class SaveStepsIsolate {
  static Future<bool> saveSteps(StepModel stepModel) async {
    ReceivePort receivePort = ReceivePort();
    Completer<bool> completer = Completer<bool>();
    Isolate isolate = await Isolate.spawn(
      _saveStepsIsolate,
      _IsolateData(
        stepModel: stepModel,
        token: RootIsolateToken.instance!,
        answerPort: receivePort.sendPort,
      ),
    );

    receivePort.listen((message) {
      receivePort.close();
      isolate.kill();
      completer.complete(message as bool);
    });

    return completer.future;
  }

  static void _saveStepsIsolate(_IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);
    try {
      await DBHelper().insertSteps(data.stepModel);
      data.answerPort.send(true);
    } catch (e) {
      data.answerPort.send(false);
    }
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort answerPort;
  final StepModel stepModel;

  _IsolateData({
    required this.token,
    required this.answerPort,
    required this.stepModel,
  });
}
