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
    GalleryModel gallery,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      await DBHelper().insertGallery(gallery);

      if (context.mounted) {
        context.router.push(GeneralRoute());
      }
      Utils.showCustomToast("Progress Saved Successfully!");
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast(e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProgress(
    GalleryModel galleryModel,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      await DBHelper().updateGallery(galleryModel);

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
