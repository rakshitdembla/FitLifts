import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/services/local_storage_utils.dart';
import 'package:flutter/material.dart';

class SplashNavigation {
  static void splashNav(BuildContext context) async {
    DocumentSnapshot<Map<String, dynamic>> checkUserProfile =
        await FirebaseFirestore.instance
            .collection(MyStrings.firebaseCollection)
            .doc(await LocalStorageUtils.getToken())
            .get();
    final userToken = await LocalStorageUtils.getToken();
    await Future.delayed(Duration(milliseconds: 1500));
    if (userToken == null || userToken.isEmpty) {
      if (context.mounted) {
        context.router.replaceAll([LoginScreenRoute()]);
      }
    } else {
      if (checkUserProfile.exists) {
        if (context.mounted) {
          context.router.replaceAll([GeneralRoute()]);
        }
      } else {
        if (context.mounted) {
          context.router.replaceAll([UserProfileScreenRoute()]);
        }
      }
    }
  }
}
