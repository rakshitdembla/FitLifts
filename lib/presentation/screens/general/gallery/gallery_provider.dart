import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../routes/auto_router.gr.dart';

class GalleryProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GalleryProvider() {
    getAllGallery();
  }

  List<GalleryModel> _imagesList = [];
  List<GalleryModel> get imagesList => _imagesList;

  Future<void> getAllGallery() async {
    _isLoading = true;
    notifyListeners();

    _imagesList = await DBHelper().getAllGallery(true);
    _isLoading = false;
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
          context.router.push(AddProgressRoute(imagePath: savedImage.path,isUpdate: false));
          _isLoading = false;
          notifyListeners();
        } else {
          _isLoading = false;
          Utils.showCustomToast("Failed to save image");
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
