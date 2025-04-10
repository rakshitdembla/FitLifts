import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/presentation/screens/general/home/home_provider.dart';
import 'package:fitlifts/services/local_storage_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/my_strings.dart';

class SettingsProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoggingOutLoading = false;
  bool get isLoggingOutLoading => _isLoggingOutLoading;

  bool _isUpdatingProfile = false;
  bool get isUpdatingProfile => _isUpdatingProfile;

  String? _userName;
  String? get userName => _userName;

  String? _userEmail;
  String? get userEmail => _userEmail;

  double? _bodyWeight;
  double? get bodyWeight => _bodyWeight;

  bool showPickedImage = false;

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
    _userToken = await LocalStorageUtils.getToken();

    try {
      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore
              .collection(MyStrings.firebaseCollection)
              .doc(userToken.toString())
              .get();

      _userName = userData[MyStrings.name];
      _profileImage =
          userData.data()!.containsKey(MyStrings.profileUrl)
              ? userData[MyStrings.profileUrl]
              : null;
      _bodyWeight =
          userData[MyStrings.bodyWeight] ?? await LocalStorageUtils.getLocalBodyWeight();
      _userEmail = userData[MyStrings.email];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      Utils.showCustomToast("Failed to load profile. Please try again.");
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

    try {
      if (_pickedImage != null) {
        final cloudName = dotenv.env["CLOUDINARY_NAME"];
        final uploadPreset = dotenv.env["UPLOAD_PRESET"];
        String cloudinaryUploadUrl =
            'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

        File imageFile = File(_pickedImage!.path);
        final imageLength = await imageFile.length();

        if (imageLength > 1000000) {
          Utils.showCustomToast("Image size too large. Maximum 1MB allowed.");
          _isUpdatingProfile = false;
          notifyListeners();
          return;
        }

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path),
          'upload_preset': uploadPreset,
        });

        Dio dio = Dio();
        Response response = await dio.post(cloudinaryUploadUrl, data: formData);

        if (response.statusCode == 200) {
          final decodedData = response.data;
          await _firestore
              .collection(MyStrings.firebaseCollection)
              .doc(_userToken)
              .update({
                MyStrings.profileUrl: decodedData["secure_url"],
                MyStrings.name: parsedName,
                MyStrings.bodyWeight: parsedWeight,
              });
        } else {
          _isUpdatingProfile = false;
          Utils.showCustomToast("Profile update failed. Please try again.");
          notifyListeners();
        }
      } else {
        await _firestore
            .collection(MyStrings.firebaseCollection)
            .doc(_userToken)
            .update({
              MyStrings.name: parsedName,
              MyStrings.bodyWeight: parsedWeight,
            });
      }
      Utils.showCustomToast("Profile updated successfully!");
      getUserData();
      nameController.clear();
      weightController.clear();

      _isUpdatingProfile = false;
      notifyListeners();
      if (context.mounted) {
        Provider.of<HomeProvider>(
          context,
          listen: false,
        ).getInitialData(context);
        context.router.pop();
      }
    } catch (e) {
      Utils.showCustomToast("An error occurred. Please try again.");
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
      showPickedImage = true;
      _initialImage = File(_pickedImage!.path);
    }
    notifyListeners();
  }

  void dontShowPickedImage() {
    showPickedImage = false;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    _isLoggingOutLoading = true;
    notifyListeners();
    try {
      LocalStorageUtils.deleteToken();
      LocalStorageUtils.saveLocalBodyWeight(0.0);
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Utils.showCustomToast("Logged out successfully");
      _isLoggingOutLoading = false;
      notifyListeners();
      context.router.replaceAll([LoginScreenRoute()]);
    } catch (e) {
      _isLoggingOutLoading = false;
      notifyListeners();
      Utils.showCustomToast("Logout failed. Please try again.");
    }
  }
}
