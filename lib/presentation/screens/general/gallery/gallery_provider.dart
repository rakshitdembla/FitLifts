import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/gallery/isolates/get_gallery.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../routes/auto_router.gr.dart';

class GalleryProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<GalleryModel> _imagesList = [];
  List<GalleryModel> get imagesList => _imagesList;

  String? _selectedSortOption;
  String? get selectedSortOption => _selectedSortOption;

  void updateSort(String newSort) {
    _selectedSortOption = newSort;
    getAllGallery();
    notifyListeners();
  }

  Future<void> getAllGallery() async {
    _isLoading = true;
    notifyListeners();

    bool getByPump = _selectedSortOption == "pump";
    bool getByHighestBodyWeight = _selectedSortOption == "highestWeight";
    bool getByLowestBodyWeight = _selectedSortOption == "lowestWeight";
    bool getByOldest = _selectedSortOption == "oldest";

    List<GalleryModel>? getGallery = await GetGalleryIsolate.getGallery(
      getByPump: getByPump,
      getByHighestBodyWeight: getByHighestBodyWeight,
      getByLowestBodyWeight: getByLowestBodyWeight,
      getByOldest: getByOldest,
    );
    if (getGallery == null) {
      _isLoading = false;
      Utils.showCustomToast("Couldn't load gallery. Pull to refresh.");
      notifyListeners();
      return;
    }
    _imagesList = getGallery;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> captureImage(BuildContext context) async {
    final pickedIMG = await Utils.showImagePicker(context, "Capture or select");
    if (pickedIMG != null) {
      _isLoading = true;
      notifyListeners();
      try {
        final File imageFile = File(pickedIMG.path);

        final directory = await getApplicationDocumentsDirectory();

        final String uniqueId = Uuid().v4();

        final String imagePath = '${directory.path}/$uniqueId.jpg';

        final savedImage = await imageFile.copy(imagePath);
        if (context.mounted) {
          context.router.push(
            AddProgressRoute(imagePath: savedImage.path, isUpdate: false),
          );
          _isLoading = false;
          notifyListeners();
        } else {
          _isLoading = false;
          Utils.showCustomToast("Image save failed");
          notifyListeners();
        }
      } catch (e) {
        Utils.showCustomToast("Oops! Try again.");
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<void> refresh() async {
    getAllGallery();
    await Future.delayed(Duration(seconds: 1));
  }
}
