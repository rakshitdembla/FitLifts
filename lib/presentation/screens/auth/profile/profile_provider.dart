import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../services/local_storage_utils.dart';

class ProfileProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? selectedValue;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserProfile(
    BuildContext context,
    String email,
    String? name,
    String? age,
    String? height,
    String? bodyWeight,
    String? gender,
  ) async {
    _isLoading = true;
    notifyListeners();

    if ([
      name,
      age,
      height,
      bodyWeight,
      gender,
    ].any((field) => field == null || field.toString().isEmpty)) {
      _isLoading = false;
      notifyListeners();
      Utils.showCustomToast("Please fill in all required fields");
      return;
    }

    int? parsedAge = int.tryParse(age ?? " ");
    int? parsedHeight = int.tryParse(height ?? " ");
    double? parsedBodyWeight = double.tryParse(bodyWeight ?? " ");

    //every field type validation
    if (name!.length < 3) {
      _isLoading = false;
      notifyListeners();
      Utils.showCustomToast("Name should be at least 3 characters");
      return;
    }

    if (parsedAge == null || parsedAge <= 0 || parsedAge >= 100) {
      _isLoading = false;
      notifyListeners();
      Utils.showCustomToast("Please enter a valid age");
      return;
    }

    if (parsedHeight == null || parsedHeight <= 0 || parsedHeight > 300) {
      _isLoading = false;
      notifyListeners();
      Utils.showCustomToast("Please enter a valid height");
      return;
    }

    if (parsedBodyWeight == null ||
        parsedBodyWeight <= 0 ||
        parsedBodyWeight > 300.00) {
      _isLoading = false;
      notifyListeners();
      Utils.showCustomToast("Please enter a valid weight");
      return;
    }

    //try uploading data on firestore
    try {
      final userToken = await LocalStorageUtils.getToken();
      Map<String, dynamic> userMap = {
        MyStrings.userToken: userToken,
        MyStrings.email: email,
        MyStrings.gender: gender,
        MyStrings.name: name,
        MyStrings.age: parsedAge,
        MyStrings.height: parsedHeight,
        MyStrings.bodyWeight: parsedBodyWeight,
        MyStrings.isPremiumUser: false,
        MyStrings.profileUrl: null,
      };

      await _firestore
          .collection(MyStrings.firebaseCollection)
          .doc(userToken.toString())
          .set(userMap);

      await LocalStorageUtils.saveLocalBodyWeight(parsedBodyWeight);

      Utils.showCustomToast("Profile created successfully!");
            if (context.mounted) {
        context.router.replaceAll([GeneralRoute()]);
      }
      _isLoading = false;
      notifyListeners();


    } catch (e) {
      Utils.showCustomToast(
        "Failed to create profile. Please check your connection",
      );
      _isLoading = false;
      notifyListeners();
    }
  }
}
