import 'package:fitlifts/data/models/exercise.dart';
import 'package:flutter/widgets.dart';

class SearchProvider with ChangeNotifier {
  String _query = "";
  List<Exercise> _filteredList = [];
  bool _isLoading = false;

  String get query => _query;
  List<Exercise> get filteredList => _filteredList;
  bool get isLoading => _isLoading;

  void searchExercise(String query, List<List<Exercise>> allExercises) {
    _isLoading = true;
    notifyListeners();
    _query = query;
    if (query.isEmpty) {
      _filteredList = allExercises.expand((list) => list).toList();
      _isLoading = false;
      notifyListeners();
    } else {
      _filteredList =
          allExercises
              .expand((list) => list)
              .where(
                (exercise) => exercise.name.toLowerCase().trim().contains(
                  query.toLowerCase().trim(),
                ),
              )
              .toList();
      _isLoading = false;
      notifyListeners();
    }
  }
}
