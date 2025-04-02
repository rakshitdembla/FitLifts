import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FirebaseAuth _auth = FirebaseAuth.instance;

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

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await Utils.saveToken(_auth.currentUser!.uid);
      _isLoading = false;
      notifyListeners();
      if (context.mounted) {
        context.router.push(GeneralRoute());
      }
    } catch (e) {
      Utils.showCustomToast(
        "Login failed. Check your email/password or reset if needed",
      );
      _isLoading = false;
      notifyListeners();
    }
  }
}