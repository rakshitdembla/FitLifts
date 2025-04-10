import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';

class ExportImportDbProvider with ChangeNotifier {
  bool _isExportingDb = false;
  bool get isExportingDb => _isExportingDb;

  bool _isImportingDb = false;
  bool get isImportingDb => _isImportingDb;

  bool _isDeleteingData = false;
  bool get isDeleteingData => _isDeleteingData;

  Future<void> exportDB() async {
    _isExportingDb = true;
    notifyListeners();
    try {
      final String dbPath = join(await getDatabasesPath(), "fitlifts.db");
      final dbFile = File(dbPath);

      if (!await dbFile.exists()) {
        Utils.showCustomToast("No workout data available for export");
        _isExportingDb = false;
        notifyListeners();
      }
      await Share.shareXFiles([XFile(dbPath)], text: "Back fitlifts data");
      Utils.showCustomToast(
        "Backup created successfully. Important: Do not rename the file",
      );
    } catch (e) {
      Utils.showCustomToast("Export failed. Please try again");
    }

    _isExportingDb = false;
    notifyListeners();
  }

  Future<void> importDB() async {
    _isImportingDb = true;
    notifyListeners();

    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.any);

      if (result == null || result.files.single.path == null) {
        Utils.showCustomToast("Import cancelled - no file selected");
        _isImportingDb = false;
        notifyListeners();
        return;
      }
      final pickedFileName = result.files.single.name;

      if (pickedFileName != "fitlifts.db") {
        Utils.showCustomToast(
          "Error: File must be named exactly 'fitlifts.db'",
        );
        _isImportingDb = false;
        notifyListeners();
        return;
      }
      final pickedFilePath = result.files.single.path;
      final pickedFile = File(pickedFilePath!);

      final String dbPath = join(await getDatabasesPath(), "fitlifts.db");

      await pickedFile.copy(dbPath);
      Utils.showCustomToast("Data imported successfully");
    } catch (e) {
      Utils.showCustomToast("Import failed. Please ensure the file is correct");
    }

    _isImportingDb = false;
    notifyListeners();
  }

  Future<void> removeAllData() async {
    _isDeleteingData = true;
    notifyListeners();

    try {
      await DBHelper().deleteAllData();
      Utils.showCustomToast("All records have been successfully deleted.");
    } catch (e) {
      Utils.showCustomToast("Oops! Something went wrong while deleting data.");
    }

    _isDeleteingData = false;
    notifyListeners();
  }

  void showDialogBox(
    String title,
    String warnings,
    VoidCallback? onOK,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
            backgroundColor: MyColors.primaryCharcoal,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),

            insetAnimationCurve: Easing.linear,
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 3.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: MyColors.whiteText,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      warnings,
                      style: TextStyle(
                        color: MyColors.whiteText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: context.router.pop,
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: MyColors.electricBlue,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        TextButton(
                          onPressed: onOK,
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                              color: MyColors.electricBlue,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
