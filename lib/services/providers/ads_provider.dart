import 'dart:developer';
import 'package:fitlifts/core/utils/ad_helper.dart';
import 'package:fitlifts/services/providers/user_initial_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class AdsProvider with ChangeNotifier {
  InterstitialAd? _homeAd;
  InterstitialAd? _workoutsAd;
  InterstitialAd? _settingsAd;

  InterstitialAd? get homeAd => _homeAd;
  InterstitialAd? get workoutsAd => _workoutsAd;
  InterstitialAd? get settingsAd => _settingsAd;

  bool _isHomeAdLoaded = false;
  bool _isWorkoutsAdLoaded = false;
  bool _isSettingsAdLoaded = false;

  bool get isHomeAdLoaded => _isHomeAdLoaded;
  bool get isWorkoutsAdLoaded => _isWorkoutsAdLoaded;
  bool get isSettingsAdLoaded => _isSettingsAdLoaded;

  void initializeHomePageAd(BuildContext context) async {
    if (!Provider.of<UserInitialDetailsProvider>(context,listen: false).isUserPremium){
    await InterstitialAd.load(
      adUnitId: AdHelper.homeInterstitialId(),
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _homeAd = ad;
          _isHomeAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          log(error.toString());
          _isHomeAdLoaded = false;
        },
      ),
    );
    notifyListeners();}
  }

  void initializeWorkoutAd(BuildContext context) async {
    if (!Provider.of<UserInitialDetailsProvider>(context,listen: false).isUserPremium) {
    await InterstitialAd.load(
      adUnitId: AdHelper.exploreWorkoutInterstitialId(),
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _workoutsAd = ad;
          _isWorkoutsAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          log(error.toString());
          _isWorkoutsAdLoaded = false;
        },
      ),
    );
    notifyListeners();}
  }

  void initializeSettingsAd(BuildContext context) async {
    if (!Provider.of<UserInitialDetailsProvider>(context,listen: false).isUserPremium) {
    await InterstitialAd.load(
      adUnitId: AdHelper.settingsInterstitialId(),
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _settingsAd = ad;
          _isSettingsAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          log(error.toString());
          _isSettingsAdLoaded = false;
        },
      ),
    );
    notifyListeners();}
  }
}
