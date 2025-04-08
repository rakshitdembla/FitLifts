import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/foundation.dart';

class CheckPremium with ChangeNotifier {
  bool _isUserPremium = false;
  bool get isUserPremium => _isUserPremium;
  String? _userToken;

  Future<void> checkUser() async {
    _userToken = await Utils.getToken();
    if (_userToken != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> userMap =
            await FirebaseFirestore.instance
                .collection(MyStrings.firebaseCollection)
                .doc(_userToken)
                .get();

        _isUserPremium = userMap[MyStrings.isPremiumUser];
        notifyListeners();
      } catch (e) {}
    }
  }
}
