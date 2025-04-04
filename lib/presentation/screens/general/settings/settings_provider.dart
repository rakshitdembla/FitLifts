import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/my_strings.dart';

class SettingsProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _userName;
  String? get userName => _userName;

  String? _userEmail;
  String? get userEmail => _userEmail;

  double? _bodyWeight;
  double? get bodyWeight => _bodyWeight;

  String? _profileImage;
  String? get profileImage => _profileImage;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get imageFile => null;

  Future<void> getUserData() async {
    _isLoading = true;
    notifyListeners();
    final userToken = await Utils.getToken();
    _bodyWeight = await Utils.getBodyWeight();
    _profileImage = await Utils.getProfileImage();
    debugPrint(_profileImage);

    try {
      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore
              .collection(MyStrings.firebaseCollection)
              .doc(userToken.toString())
              .get();

      _userEmail = userData[MyStrings.email];
      _userName = userData[MyStrings.name];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      Utils.showCustomToast("Unable to fetch user profile");
      notifyListeners();
    }
  }

  Future<void> uploadProfileImage(BuildContext context) async {
    final XFile? pickedImage = await Utils.showImagePicker(
      context,
      "Choose a image source",
    );

    try {
      if (pickedImage != null) {
        final File imageFile = File(pickedImage.path);

        final directory = await getApplicationDocumentsDirectory();
        final String uniqueId = Uuid().v4();
        final String imagePath = '${directory.path}/profile_$uniqueId.jpg';

        final savedImage = await imageFile.copy(imagePath);
        Utils.saveProfileImage(savedImage.path);
        debugPrint(savedImage.path);
        Utils.showCustomToast('Profileupdated');
        getUserData();
      } else {
        return;
      }
    } catch (e) {
      Utils.showCustomToast("An error occured");
      debugPrint(e.toString());
    }
  }
}
