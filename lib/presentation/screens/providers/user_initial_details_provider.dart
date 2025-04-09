import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/foundation.dart';

class UserInitialDetailsProvider with ChangeNotifier {
  bool _isUserPremium = true;
  bool get isUserPremium => _isUserPremium;
  String? _userToken;

  double? _bodyWeight;
  double? get bodyWeight => _bodyWeight;

  String? _profileUrl;
  String? get profileUrl => _profileUrl;

   String? _userName;
  String? get userName => _userName;

  Future<void> getUserDetails() async {
    _userToken = await Utils.getToken();
    if (_userToken != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> userMap =
            await FirebaseFirestore.instance
                .collection(MyStrings.firebaseCollection)
                .doc(_userToken)
                .get();
        if (!userMap.exists || userMap.data() == null) {
          return;
        }

        _isUserPremium = userMap[MyStrings.isPremiumUser];

        _bodyWeight = userMap[MyStrings.bodyWeight];

        _userName = userMap[MyStrings.name];

        if (userMap.data()!.containsKey(MyStrings.profileUrl)) {
          _profileUrl = userMap[MyStrings.profileUrl];
        }

        notifyListeners();
      } catch (e) {}
    }
  }
}
