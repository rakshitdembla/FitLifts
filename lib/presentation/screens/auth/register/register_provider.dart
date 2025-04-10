import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/services/auth_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../../services/local_storage_utils.dart';

class RegisterProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailPassword(
    String email,
    String password,
    String cPassword,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (!AuthUtils.isValidEmail(email)) {
        Utils.showCustomToast(
          "Please enter a valid email (e.g., name@example.com)",
        );
        _isLoading = false;
        notifyListeners();
        return;
      }

      if (!AuthUtils.isValidPassword(password)) {
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

      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user == null) {
        _isLoading = false;
        notifyListeners();
        Utils.showCustomToast(
          "Oops! Unable to sign up. Please check your credentials or internet connection",
        );
        return;
      }

      await LocalStorageUtils.saveToken(_auth.currentUser!.uid);
      if (context.mounted) {
        context.router.replaceAll([UserProfileScreenRoute()]);
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
