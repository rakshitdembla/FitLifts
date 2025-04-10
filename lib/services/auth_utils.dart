import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/services/local_storage_utils.dart';
import 'package:flutter/material.dart';

class AuthUtils {
  // Authentication & Firebase Utilities
  static Future<void> firebaseAuthProfileCheck(BuildContext context) async {
    final userProfileData =
        await FirebaseFirestore.instance
            .collection(MyStrings.firebaseCollection)
            .doc(await LocalStorageUtils.getToken())
            .get();

    if (context.mounted) {
      if (userProfileData.exists) {
        context.router.replaceAll([GeneralRoute()]);
      } else {
        context.router.replaceAll([UserProfileScreenRoute()]);
      }
    }
  }

  static String? getUserEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser!.email;
  }

   // Validation Utilities
  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}