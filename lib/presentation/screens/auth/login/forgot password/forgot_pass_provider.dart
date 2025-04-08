import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ForgotPassProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> forgotPassword(String email, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    if (!Utils.isValidEmail(email)) {
      Utils.showCustomToast("Please enter a valid email address.");
      _isLoading = false;
      notifyListeners();
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Utils.showCustomToast(
        "Reset email sent! Use the link to create an 8+ character password with at least 1 number.",
      );

      if (context.mounted) {
        context.router.pop();
      }

    } catch (e) {
      Utils.showCustomToast(
        "Reset failed! Unable to send the reset link. Please try again.",
      );
    }
      _isLoading = false;
      notifyListeners();
  }
}
