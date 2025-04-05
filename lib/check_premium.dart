import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/foundation.dart';

class CheckPremium with ChangeNotifier {
  bool _isUserPremium = false;
  bool get isUserPremium => _isUserPremium;
  String? _userToken;
  CheckPremium() {
    checkUser();
  } // make sure to call this again in login or register routings

  Future<void> checkUser() async {
    _userToken = await Utils.getToken();
    if (_userToken != null) {
      debugPrint("checking if user is premium");
try {
      DocumentSnapshot<Map<String, dynamic>> userMap =
          await FirebaseFirestore.instance
              .collection(MyStrings.firebaseCollection)
              .doc(_userToken)
              .get();

      _isUserPremium = userMap[MyStrings.isPremiumUser];
      notifyListeners();} catch(e) {
        debugPrint(e.toString());
      }
    }
  }
}
