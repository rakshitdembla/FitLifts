import 'dart:async';
import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckPermissionIsolate {
  static Future<bool?> check() async {
    ReceivePort receivePort = ReceivePort();
    Completer<bool?> completer = Completer<bool?>();

    Isolate isolate = await Isolate.spawn(
      _checkIsolate,
      _IsolateData(
        sendPort: receivePort.sendPort,
        token: RootIsolateToken.instance!,
      ),
    );

    receivePort.listen((message) {
      receivePort.close();
      isolate.kill();
      completer.complete(message);
    });

    return completer.future;
  }

  static void _checkIsolate(_IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);
    try {
      final checkPermission = await Permission.activityRecognition.status;
      data.sendPort.send(checkPermission.isGranted);
    } catch (e) {
      data.sendPort.send(null);
    }
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort sendPort;

  _IsolateData({required this.sendPort, required this.token});
}
