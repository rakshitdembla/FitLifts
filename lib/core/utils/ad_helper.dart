import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdHelper with ChangeNotifier {
  static String homeInterstitialId() {
    if (Platform.isAndroid) {
      return dotenv.env["HOMEAD"].toString();
    } else {
      return "";
    }
  }

  static String exploreWorkoutInterstitialId() {
    if (Platform.isAndroid) {
      return dotenv.env["WORKOUTAD"].toString();
    } else {
      return "";
    }
  }

  static String settingsInterstitialId() {
    if (Platform.isAndroid) {
      return dotenv.env["SETTINGSAD"].toString();
    } else {
      return "";
    }
  }

  static String updateProgressInterstitialId() {
    if (Platform.isAndroid) {
      return dotenv.env["PROGRESSAD"].toString();
    } else {
      return "";
    }
  }
}
