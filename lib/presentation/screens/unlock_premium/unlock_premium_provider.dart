import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/services/auth_utils.dart';
import 'package:fitlifts/services/providers/user_initial_details_provider.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../services/local_storage_utils.dart';

class UnlockPremiumProvider with ChangeNotifier {
  late Razorpay _razorpay;
  String? _userEmail;
  String? _userToken;

  BuildContext? _context;

  UnlockPremiumProvider() {
    getUserData();
  }

  void initStateFN() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void disposeFN() {
    _razorpay.clear();
  }

  Future<void> getUserData() async {
    _userEmail = AuthUtils.getUserEmail();
    _userToken = await LocalStorageUtils.getToken();
  }

  //___________________________________________________________________

  void startPayment(BuildContext context) {
    _context = context;

    if (_userToken == null) {
      Utils.showCustomToast(
        "Unable to verify your account. Please try again later.",
      );
      return;
    }
    var options = {
      'key': dotenv.env['RAZORPAY_KEY'],
      'amount': 19900,
      'name': 'FitLifts Premium',
      'description': 'Premium Upgrade',
      'prefill': {'email': _userEmail},
      'currency': 'INR',
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      Utils.showCustomToast(
        "Failed to process payment. Please check your connection and try again.",
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      await FirebaseFirestore.instance
          .collection(MyStrings.firebaseCollection)
          .doc(_userToken)
          .set({MyStrings.isPremiumUser: true}, SetOptions(merge: true));
      Utils.showCustomToast("Payment successful! Premium features unlocked.");
      if (_context != null && _context!.mounted) {
        Provider.of<UserInitialDetailsProvider>(
          _context!,
          listen: false,
        ).getUserDetails();
      } else {
        Utils.showCustomToast(
          "Premium unlocked! Restart the app to access all features.",
        );
      }
    } catch (e) {
      Utils.showCustomToast(
        "Payment processed but we couldn't upgrade your account. Contact support with payment ID: ${response.paymentId}",
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Utils.showCustomToast(
      "Payment failed. Please try again or use a different payment method.",
    );
    notifyListeners();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}
}
