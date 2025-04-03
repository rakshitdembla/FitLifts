import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/general/gallery/isolates/get_gallery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../routes/auto_router.gr.dart';

class GalleryProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  bool _gotInitialData = false;

  List<GalleryModel> _imagesList = [];
  List<GalleryModel> get imagesList => _imagesList;

  String _selectedSortOption = "latest";
  String get selectedSortOption => _selectedSortOption;

  void updateSort(String newSort) {
    _selectedSortOption = newSort;
    getAllGallery();
    notifyListeners();
  }

  Future<void> getAllGallery() async {
    debugPrint("get gallery called");
    _isLoading = true;
    _gotInitialData = false;
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
      _gotInitialData = true;
      Utils.showCustomToast(
        "Failed to fetch data, Please try refreshing the page",
      );
      return;
    }
    _imagesList = getGallery;
    _isLoading = false;
    _gotInitialData = true;
    notifyListeners();
  }

  Future<void> captureImage(BuildContext context) async {
    final pickedIMG = await ImagePicker().pickImage(source: ImageSource.camera);
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
          Utils.showCustomToast("Failed to save image");
          notifyListeners();
        }
      } catch (e) {
        Utils.showCustomToast("An error occured, Please try again.");
      }
    }
  }

  Future<void> refresh() async {
    if (_gotInitialData) {
      getAllGallery();
    }

    await Future.delayed(Duration(seconds: 1));
  }
}
