import 'package:flutter/widgets.dart';

class ExercisesViewProvider with ChangeNotifier {
  bool _isLoading = false;
  bool  get isLoading => _isLoading;

  void loadingDelay() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    _isLoading = false;
    notifyListeners();
  }
}
