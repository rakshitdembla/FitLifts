import 'dart:math';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/graph_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../data/models/step_model.dart';

class GraphProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<GraphDataModel> _filteredList = [];
  List<GraphDataModel> get filteredList => _filteredList;

  double _maximum = 10000;
  double get maximum => _maximum;
  double _interval = 1000;
  double get interval => _interval;

    bool _gotInitalData = false;
  bool get gotInitialData => _gotInitalData;

  Future<void> getWeekSteps() async {
    _isLoading = true;
    notifyListeners();
    _gotInitalData = false;
    try {
      Map<String, GraphDataModel> map = {};
      List<StepModel> weeklySteps = await DBHelper().getWeekSteps();

      for (var step in weeklySteps) {
        String formattedDate = formatDate(step.date);

        if (!map.containsKey(formattedDate)) {
          map[formattedDate] = GraphDataModel(formattedDate, 0);
        }

        map[formattedDate] = map[formattedDate]!.copyWith(
          map[formattedDate]!.steps + step.stepCount,
        );
      }
      _filteredList =
          map.values.toList()..sort(
            (a, b) => DateFormat(
              "d MMM, yy",
            ).parse(a.date).compareTo(DateFormat("d MMM, yy").parse(b.date)),
          );

      getHighestSteps();
      _isLoading = false;
      _gotInitalData = true;
      notifyListeners();
    } catch (e) {
      _gotInitalData = true;
      _isLoading = false;
      Utils.showCustomToast("Failed to get past week data");
    }
  }

  String formatDate(DateTime date) {
    return DateFormat("d MMM, yy").format(date);
  }

  void getHighestSteps() {
    if (_filteredList.isEmpty) return;

    double maxSteps = _filteredList.map((e) => e.steps).fold(0, max).toDouble();
    double padding = (maxSteps * 0.1).clamp(200, 2000);
    _maximum = (maxSteps + padding).ceilToDouble();

    _interval = (_maximum / 10).ceilToDouble();

    if (_interval > 1000) {
      _interval = (_interval / 1000).ceil() * 1000;
    } else if (_interval > 100) {
      _interval = (_interval / 100).ceil() * 100;
    } else {
      _interval = (_interval / 10).ceil() * 10;
    }
  }
}
