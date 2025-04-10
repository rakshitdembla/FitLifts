import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../services/auth_utils.dart';
import '../../../../services/local_storage_utils.dart';
import '../../../utils.dart';

class SocialLoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> continueWithGoogle(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    await signoutGoogle();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        Utils.showCustomToast("Google sign-in cancelled - try again");
        _isLoading = false;
        notifyListeners();
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        if (user.isAnonymous) {
          _isLoading = false;
          notifyListeners();
          Utils.showCustomToast("User is anonymous!");
          return;
        }

        if (_auth.currentUser!.uid != user.uid) {
          _isLoading = false;
          notifyListeners();
          Utils.showCustomToast(
            "Something went wrong. Please try again later.",
          );
          return;
        }
      } else {
        Utils.showCustomToast(
          "Couldn't complete Google sign-in. Try again later",
        );
        _isLoading = false;
        notifyListeners();
        return;
      }
      await LocalStorageUtils.saveToken(user.uid);

      if (context.mounted) {
        await AuthUtils.firebaseAuthProfileCheck(context);
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Utils.showCustomToast("Google sign-in failed. Check your connection");
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signoutGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint("Firebase signOut failed: $e");
    }

    try {
      await _googleSignIn.disconnect();
    } catch (e) {
      debugPrint("Google disconnect failed: $e");
    }

    try {
      await _googleSignIn.signOut();
    } catch (e) {
      debugPrint("Google signOut failed: $e");
    }
  }
}
