import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../check_premium.dart';

class RegisterProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailPassword(
    String email,
    String password,
    String cPassword,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (!Utils.isValidEmail(email)) {
        Utils.showCustomToast(
          "Please enter a valid email (e.g., name@example.com)",
        );
        _isLoading = false;
        notifyListeners();
        return;
      }

      if (!Utils.isValidPassword(password)) {
        Utils.showCustomToast(
          "Use 8+ characters with at least 1 number for your password",
        );
        _isLoading = false;
        notifyListeners();
        return;
      }

      if (password != cPassword) {
        Utils.showCustomToast("Passwords don't match. Please re-enter them");
        _isLoading = false;
        notifyListeners();
        return;
      }

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await Utils.saveToken(_auth.currentUser!.uid);
      _isLoading = false;

      notifyListeners();
      if (context.mounted) {
        Provider.of<CheckPremium>(context, listen: false).checkUser();
        context.router.push(UserProfileScreenRoute());
      }
    } catch (e) {
      Utils.showCustomToast(
        // "Registration failed. If this continues, try a different email/password",
        e.toString()
      );
      _isLoading = false;
      notifyListeners();
    }
  }
}
