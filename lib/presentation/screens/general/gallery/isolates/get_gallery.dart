import 'dart:async';
import 'dart:isolate';

import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:flutter/services.dart';

import '../../../../../data/data_source/local/sqf database/db_helper.dart';

class GetGalleryIsolate {
  static Future<List<GalleryModel>?> getGallery({
    required bool getByPump,
    required bool getByHighestBodyWeight,
    required bool getByLowestBodyWeight,
    required bool getByOldest,
  }) async {
    ReceivePort receivePort = ReceivePort();
    Completer<List<GalleryModel>?> completer = Completer<List<GalleryModel>?>();

    Isolate isolate = await Isolate.spawn(
      _galleryIsolate,
      _IsolateData(
        sendPort: receivePort.sendPort,
        token: RootIsolateToken.instance!,
        getByHighestBodyWeight: getByHighestBodyWeight,
        getByPump: getByPump,
        getByLowestBodyWeight: getByLowestBodyWeight,
        getByOldest: getByOldest,
      ),
    );

    receivePort.listen((message) {
      receivePort.close();
      isolate.kill();
      completer.complete(message);
    });

    return completer.future;
  }

  static void _galleryIsolate(_IsolateData data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.token);

    try {
      List<GalleryModel>? gallery;
      if (data.getByHighestBodyWeight) {
        gallery = await DBHelper().getGalleryByWeight(false);
      } else if (data.getByLowestBodyWeight) {
        gallery = await DBHelper().getGalleryByWeight(true);
      } else if (data.getByPump) {
        gallery = await DBHelper().getGalleryByPump();
      } else if (data.getByOldest) {
        gallery = await DBHelper().getAllGallery(true);
      } else {
        gallery = await DBHelper().getAllGallery(false);
      }

      data.sendPort.send(gallery);
    } catch (e) {
      data.sendPort.send(null);
    }
  }
}

class _IsolateData {
  final RootIsolateToken token;
  final SendPort sendPort;
  final bool getByPump;
  final bool getByHighestBodyWeight;
  final bool getByLowestBodyWeight;
  final bool getByOldest;

  _IsolateData({
    required this.sendPort,
    required this.token,
    required this.getByHighestBodyWeight,
    required this.getByLowestBodyWeight,
    required this.getByOldest,
    required this.getByPump,
  });
}
