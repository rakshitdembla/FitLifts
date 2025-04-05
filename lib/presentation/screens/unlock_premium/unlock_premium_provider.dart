import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/check_premium.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class UnlockPremiumProvider with ChangeNotifier {
  late Razorpay _razorpay;
  String? _userEmail;
  String? _userToken;

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
    _userEmail = Utils.getUserEmail();
    _userToken = await Utils.getToken();
  }

  //___________________________________________________________________

  void startPayment() {
    if (_userToken == null) {
      Utils.showCustomToast("An unexpected error occured");
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
      Utils.showCustomToast(e.toString());
    }
  }

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
    BuildContext context,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection(MyStrings.firebaseCollection)
          .doc(_userToken)
          .set({MyStrings.isPremiumUser: true});
      Utils.showCustomToast("Payment successful: ${response.paymentId}");
      if (context.mounted) {
        Provider.of<CheckPremium>(context, listen: false).checkUser();
      } else {
        Utils.showCustomToast("Please restart your app.");
      }
    } catch (e) {
      Utils.showCustomToast(e.toString());
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Utils.showCustomToast("Payment failed: ${response.message}");
    notifyListeners();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("External wallet selected: ${response.walletName}");
  }
}
