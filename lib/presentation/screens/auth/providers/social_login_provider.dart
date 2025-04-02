import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/utils/utils.dart';
import '../../../routes/auto_router.gr.dart';

class SocialLoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> continueWithGoogle(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
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
        assert(!user.isAnonymous);
        final User? currentuser = _auth.currentUser;
        assert(currentuser!.uid == user.uid);
      } else {
        Utils.showCustomToast("Couldn't complete Google sign-in. Try again later");
        _isLoading = false;
        notifyListeners();
        return;
      }
      await Utils.saveToken(user.uid);
      _isLoading = false;
      notifyListeners();
      if (context.mounted) {
        context.router.push(UserProfileScreenRoute());
      }
    } catch (e) {
      Utils.showCustomToast("Google sign-in failed. Check your connection");
      _isLoading = false;
      notifyListeners();
    }
  }
}
