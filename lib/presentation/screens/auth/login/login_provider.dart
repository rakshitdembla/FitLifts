import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginWithEmailPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (!Utils.isValidEmail(email)) {
        Utils.showCustomToast("Enter a valid email (e.g., you@example.com)");
        _isLoading = false;
        notifyListeners();
        return;
      }

      if (!Utils.isValidPassword(password)) {
        Utils.showCustomToast(
          "Password needs 8+ characters with at least 1 number",
        );
        _isLoading = false;
        notifyListeners();
        return;
      }

      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user == null) {
        _isLoading = false;
        notifyListeners();
        Utils.showCustomToast(
          "Oops! Unable to log in. Please check your credentials or internet connection",
        );
        return;
      }
      await Utils.saveToken(_auth.currentUser!.uid);
      if (context.mounted) {
        await Utils.firebaseAuthProfileCheck(context);
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast(e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
