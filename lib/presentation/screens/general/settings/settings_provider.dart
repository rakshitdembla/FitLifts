import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/my_strings.dart';

class SettingsProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUpdatingProfile = false;
  bool get isUpdatingProfile => _isUpdatingProfile;

  String? _userName;
  String? get userName => _userName;

  String? _userEmail;
  String? get userEmail => _userEmail;

  double? _bodyWeight;
  double? get bodyWeight => _bodyWeight;

  String? _profileImage;
  String? get profileImage => _profileImage;

  String? _userToken;
  String? get userToken => _userToken;

  XFile? _pickedImage;

  File? _initialImage;
  File? get initialImage => _initialImage;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get imageFile => null;

  Future<void> getUserData() async {
    _isLoading = true;
    notifyListeners();
    _userToken = await Utils.getToken();
    debugPrint(_profileImage);

    try {
      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore
              .collection(MyStrings.firebaseCollection)
              .doc(userToken.toString())
              .get();

      _userEmail = userData[MyStrings.email];
      _userName = userData[MyStrings.name];
      _profileImage = userData[MyStrings.profileUrl];
      _bodyWeight = userData[MyStrings.bodyWeight];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      Utils.showCustomToast("Unable to fetch user profile");
      notifyListeners();
    }
  }

  Future<void> updateProfileDetails(
    BuildContext context,
    String? name,
    String? bodyWeight,
    TextEditingController nameController,
    TextEditingController weightController,
  ) async {
    _isUpdatingProfile = true;
    notifyListeners();

    String? parsedName = name ?? _userName;
    double? parsedWeight =
        double.tryParse(bodyWeight.toString()) ?? _bodyWeight;

    final cloudName = dotenv.env["CLOUDINARY_NAME"];
    final uploadPreset = dotenv.env["UPLOAD_PRESET"];
    String cloudinaryUploadUrl =
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    if (_pickedImage == null) {
      return;
    }
    File imageFile = File(_pickedImage!.path);
    final imageLength = await imageFile.length();
    if (imageLength > 1000000) {
      Utils.showCustomToast("File too large. Max allowed size is 1MB.");
      _isUpdatingProfile = false;
      notifyListeners();
      return;
    }

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
      'upload_preset': uploadPreset,
    });

    Dio dio = Dio();

    try {
      Response response = await dio.post(cloudinaryUploadUrl, data: formData);
      debugPrint("posting response");
      if (response.statusCode == 200) {
        debugPrint("200 response");
        final decodedData = response.data;
        debugPrint("decoded data");
        await _firestore
            .collection(MyStrings.firebaseCollection)
            .doc(_userToken)
            .set({
              MyStrings.profileUrl: decodedData["secure_url"],
              MyStrings.name: parsedName,
              MyStrings.bodyWeight: parsedWeight,
            });
        Utils.showCustomToast("Profile Updated Successfully");
        getUserData();
        nameController.clear();
        weightController.clear();
        _isUpdatingProfile = false;
        notifyListeners();
        if (context.mounted) {
          context.router.pop();
        }
      } else {
        Utils.showCustomToast("Error - response code : ${response.statusCode}");
        _isUpdatingProfile = false;
        notifyListeners();
      }
    } catch (e) {
      Utils.showCustomToast(e.toString());
      _isUpdatingProfile = false;
      notifyListeners();
    }
  }

  void pickImage(BuildContext context) async {
    _pickedImage = await Utils.showImagePicker(
      context,
      "Choose a image source",
    );
    if (_pickedImage != null) {
      _initialImage = File(_pickedImage!.path);
    }
    notifyListeners();
  }
}
