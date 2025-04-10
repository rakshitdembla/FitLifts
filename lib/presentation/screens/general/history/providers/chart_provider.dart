import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/graph_model.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../data/models/step_model.dart';

class ChartProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<GraphDataModel> _filteredList = [];
  List<GraphDataModel> get filteredList => _filteredList;

  Future<void> getWeekSteps() async {
    _isLoading = true;
    notifyListeners();
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
              "d MMM",
            ).parse(a.date).compareTo(DateFormat("d MMM").parse(b.date)),
          );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      Utils.showCustomToast(
        "Couldn't load your step history. Please try again.",
      );
      notifyListeners();
    }
  }

  String formatDate(DateTime date) {
    return DateFormat("d MMM").format(date);
  }


}
