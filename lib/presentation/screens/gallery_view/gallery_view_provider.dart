import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/widgets.dart';

import '../../routes/auto_router.gr.dart';

class GalleryViewProvider with ChangeNotifier {
  bool _isUpdateLoading = false;
  bool get isUpdateLoading => _isUpdateLoading;

  bool _isDeleteLoading = false;
  bool get isDeleteLoading => _isDeleteLoading;

  void updateProgress(GalleryModel galleryModel, BuildContext context) {
    _isUpdateLoading = true;
    notifyListeners();

    if (context.mounted) {
      context.router.push(
        AddProgressRoute(galleryModel: galleryModel, isUpdate: true),
      );
    } else {
      Utils.showCustomToast("An unexpected error occured!");
    }

    _isUpdateLoading = false;
    notifyListeners();
  }

  Future<void> deleteProgress(int deleteId, BuildContext context) async {
    _isDeleteLoading = true;
    notifyListeners();

    try {
      await DBHelper().deleteGallery(deleteId);
      Utils.showCustomToast("Progress Deleted Successfully!");
      if (context.mounted) {
        context.router.push(GeneralRoute());
      }
      _isDeleteLoading = false;
    } catch (error) {
      Utils.showCustomToast(error.toString());
      _isDeleteLoading = false;
    }
  }
}
