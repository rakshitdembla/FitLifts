import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  Utils._();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    bool isSuccess,
    BuildContext context,
    String message,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 15.sp,
            color: MyColors.whiteText,
          ),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  static Future<String?> selectExerciseNav(BuildContext context) async {
    final result = await context.router.push(WorkoutsListRoute());
    if (result != null) {
      if (context.mounted) {
        return result.toString();
      }
      return null;
    } else {
      return null;
    }
  }

  static Future<void> requestPermissions() async {
    bool isNotificationsAllowed = await Permission.notification.isGranted;
    bool isActivityAllowed = await Permission.activityRecognition.isGranted;

    if (!isNotificationsAllowed) {
      await Permission.notification.request();
    }

    if (!isActivityAllowed) {
      await Permission.activityRecognition.request();
    }
  }

  static void showCustomToast(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: MyColors.darkGrey,
        textColor: MyColors.whiteText,
        fontSize: 16.0.sp,
      );
    });
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static double calculateWorkoutCalories(
    double bodyWeightKg,
    int reps,
    double weightLiftedKg,
  ) {
    double caloriesPerRepPerKg = 0.003;

    double caloriesBurned =
        reps *
        weightLiftedKg *
        caloriesPerRepPerKg *
        (1 + (bodyWeightKg / 1000));

    return caloriesBurned;
  }

  static Future<void> saveToken(String tokenValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(MyStrings.savedToken, tokenValue);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(MyStrings.savedToken);
  }

  static String? getUserEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser!.email;
  }

  static Future<double> getBodyWeight() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final userToken = await getToken();

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore
            .collection(MyStrings.firebaseCollection)
            .doc(userToken)
            .get();

    if (snapshot.exists && snapshot.data() != null) {
      return (snapshot.data()![MyStrings.bodyWeight] ?? 70).toDouble();
    } else {
      return 70.0;
    }
  }

  static Future<double> getLocalBodyWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(MyStrings.savedBodyWeight) ?? 75.00;
  }

  static Future<void> saveLocalBodyWeight(double bodyWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(MyStrings.savedBodyWeight, bodyWeight);
  }

  static Future<int> getLastSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(MyStrings.savedSteps) ?? 0;
  }

  static Future<void> saveLastSteps(int dbSteps) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(MyStrings.savedSteps, dbSteps);
  }

  static Future<XFile?> showImagePicker(
    BuildContext context,
    String? title,
  ) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: MyColors.primaryCharcoal,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Wrap(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  title.toString(),
                  style: TextStyle(
                    color: MyColors.whiteText,
                    fontWeight: FontWeight.w800,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Divider(color: Colors.grey),
              SizedBox(height: 0.h),
              ListTile(
                leading: Icon(Icons.camera, color: MyColors.whiteText),
                title: Text(
                  'Camera',
                  style: TextStyle(color: MyColors.whiteText),
                ),
                onTap: () async {
                  pickedImage = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (context.mounted) {
                    Navigator.pop(context, pickedImage);
                  } else {
                    Utils.showCustomToast("Unable to pick image");
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.photo_library, color: MyColors.whiteText),
                title: Text(
                  'Gallery',
                  style: TextStyle(color: MyColors.whiteText),
                ),
                onTap: () async {
                  pickedImage = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (context.mounted) {
                    Navigator.pop(context, pickedImage);
                  } else {
                    Utils.showCustomToast("Unable to pick image");
                  }
                },
              ),
            ],
          ),
        );
      },
    );

    return pickedImage;
  }

  static void saveProfileImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(MyStrings.savedProfile, imagePath);
  }
  static Future<String?> getProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(MyStrings.savedProfile);
  }
}
