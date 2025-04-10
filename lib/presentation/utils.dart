import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  Utils._();

  // UI Related Utilities
  static bool _isPickingImage = false;

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

  static Future<XFile?> showImagePicker(
    BuildContext context,
    String? title,
  ) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage;
    _isPickingImage = false;

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

              ListTile(
                leading: Icon(Icons.camera, color: MyColors.whiteText),
                title: Text(
                  'Camera',
                  style: TextStyle(color: MyColors.whiteText),
                ),
                onTap: () async {
                  if (!_isPickingImage) {
                    _isPickingImage = true;
                    pickedImage = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                  }

                  _isPickingImage = false;
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
                  if (!_isPickingImage) {
                    _isPickingImage = true;
                    pickedImage = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                  }
                  _isPickingImage = false;
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

  // Navigation Utilities
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

  // Permission Utilities
  static Future<void> requestPermissions() async {
    Permission permission = Permission.activityRecognition;
    if (!await permission.isDenied || !await permission.isPermanentlyDenied) {
      await permission.request();
    }
  }

  // Fitness Calculation Utilities
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
}
