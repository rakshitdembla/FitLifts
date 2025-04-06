import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/controller_service.dart';
import 'package:fitlifts/presentation/screens/general/gallery/gallery_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../routes/auto_router.gr.dart';

class AddProgressProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createProgress(
    String imagePath,
    String ratePump,
    String bodyWeight,
    BuildContext context,
    TextEditingController bodyWeightController,
    TextEditingController pumpController,
  ) async {
    _isLoading = true;
    notifyListeners();

    int? parsedPump = int.tryParse(ratePump);
    double? parsedWeight =
        double.tryParse(bodyWeight) ?? await Utils.getBodyWeight();

    if (parsedPump != null && (parsedPump > 10 || parsedPump < 0)) {
      Utils.showCustomToast("Pump rating must be between 0-10");
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await Utils.saveLocalBodyWeight(parsedWeight);
      await DBHelper().insertGallery(
        GalleryModel(
          imagePath: imagePath,
          date: DateTime.now(),
          bodyWeight: parsedWeight,
          ratePump: parsedPump,
        ),
      );
      if (context.mounted) {
        await Provider.of<GalleryProvider>(
          context,
          listen: false,
        ).getAllGallery();
        if (context.mounted) {
          TabControllerService.persistentTabController.index = 2;
          context.router.replaceAll([GeneralRoute()]);
        }
      }
      Utils.showCustomToast("Progress saved!");
      clearControllers(bodyWeightController, pumpController);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast("Failed to save progress");
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
    TextEditingController bodyWeightController,
    TextEditingController pumpController,
  ) async {
    _isLoading = true;
    notifyListeners();
    int? parsedPump = int.tryParse(ratePump) ?? previousPump;
    double? parsedWeight =
        double.tryParse(bodyWeight) ??
        previousWeight ??
        await Utils.getBodyWeight();

    if (parsedPump != null && (parsedPump > 10 || parsedPump < 0)) {
      Utils.showCustomToast("Pump rating must be between 0-10");
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
        await Provider.of<GalleryProvider>(
          context,
          listen: false,
        ).getAllGallery();
        if (context.mounted) {
          TabControllerService.persistentTabController.index = 2;
           context.router.replaceAll([GeneralRoute()]);
        }
      }
      Utils.showCustomToast("Progress updated!");
      clearControllers(bodyWeightController, pumpController);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast("Update failed");
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearControllers(
    TextEditingController bodyWeightController,
    TextEditingController pumpController,
  ) {
    bodyWeightController.clear();
    pumpController.clear();
  }
}
