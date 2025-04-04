import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class AddProgressProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createProgress(
    String imagePath,
    String ratePump,
    String bodyWeight,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();

    int? parsedPump = int.tryParse(ratePump);
    double? parsedWeight =
        double.tryParse(bodyWeight) ?? await Utils.getBodyWeight();

    if (parsedPump != null && parsedPump > 10 && parsedPump < 0) {
      Utils.showCustomToast("Please enter valid pump max 10");
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await DBHelper().insertGallery(
        GalleryModel(
          imagePath: imagePath,
          date: DateTime.now(),
          bodyWeight: parsedWeight,
          ratePump: parsedPump,
        ),
      );
      if (context.mounted) {
        context.router.push(GeneralRoute());
      }
      Utils.showCustomToast("Progress Saved Successfully!");
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast("An error occured, Please try again.");
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProgress(
    int id,
    String imagePath,
    DateTime date,
    String bodyWeight,
    String ratePump,
    int? previousPump,
    double? previousWeight,

    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    int? parsedPump = int.tryParse(ratePump) ?? previousPump;
    double? parsedWeight =
        double.tryParse(bodyWeight) ??
        previousWeight ??
        await Utils.getBodyWeight();

    if (parsedPump != null && parsedPump > 10 && parsedPump < 0) {
      Utils.showCustomToast("Please enter valid pump max 10");
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await DBHelper().updateGallery(
        GalleryModel(
          imagePath: imagePath,
          date: date,
          bodyWeight: parsedWeight,
          ratePump: parsedPump,
          id: id,
        ),
      );

      if (context.mounted) {
        context.router.push(GeneralRoute());
      }
      Utils.showCustomToast("Progress Updated Successfully!");
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast(e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
