import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/presentation/common_widgets/datetime_widget.dart';
import 'package:fitlifts/presentation/common_widgets/elevated_cta.dart';
import 'package:fitlifts/presentation/common_widgets/num_field.dart';
import 'package:fitlifts/presentation/common_widgets/circular_progress.dart';
import 'package:fitlifts/presentation/screens/general/gallery/add_progress_image/add_progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/my_colors.dart';

@RoutePage()
class AddProgress extends StatefulWidget {
  final bool isUpdate;
  final String? imagePath;
  final GalleryModel? galleryModel;
  const AddProgress({
    super.key,
    this.imagePath,
    required this.isUpdate,
    this.galleryModel,
  });

  @override
  State<AddProgress> createState() => _AddProgressState();
}

class _AddProgressState extends State<AddProgress> {
  TextEditingController bodyWeightController = TextEditingController();
  TextEditingController pumpController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdate) {
      bodyWeightController.text =
          widget.galleryModel?.bodyWeight?.toString() ?? "";
      pumpController.text = widget.galleryModel?.ratePump?.toString() ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    bodyWeightController.dispose();
    pumpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          "Progress Image Details",
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(9.w, 15.h, 9.w, 25.w),

        child: Column(
          children: [
            NumField(
              controller: bodyWeightController,
              hintText: "Current Body Weight",
              labelTitle: "Body Weight",
              maxLength: 5,
              suffix: Text("Kg"),
            ),
            SizedBox(height: 25.h),
            NumField(
              controller: pumpController,
              hintText: "Rate Body Pump",
              labelTitle: "Body Pump",
              maxLength: 2,
              suffix: Text("/10"),
            ),
            SizedBox(height: 25.h),
            DateTimeWidget(showDate: false),
            SizedBox(height: 30.h),
          ],
        ),
      ),

      bottomNavigationBar: Consumer<AddProgressProvider>(
        builder: (context, addProgressProvider, child) {
          return addProgressProvider.isLoading
              ? Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
                  left: 9.w,
                  right: 9.w,
                ),
                child: CircularProgressLoading(),
              )
              : Padding(
                  padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
                  left: 9.w,
                  right: 9.w,
                ),
                child: ElevatedCTA(
                  title: widget.isUpdate ? "Update" : "Save",
                  onPressed: () {
                    widget.isUpdate
                        ? addProgressProvider.updateProgress(
                          widget.galleryModel!.id!,
                          widget.galleryModel!.imagePath,
                          widget.galleryModel!.date,
                          bodyWeightController.text.toString(),
                          pumpController.text,
                          widget.galleryModel?.ratePump,
                          widget.galleryModel?.bodyWeight,
                          context,
                          bodyWeightController,
                          pumpController,
                        )
                        : addProgressProvider.createProgress(
                          widget.imagePath!,
                          pumpController.text.toString(),
                          bodyWeightController.text.toString(),
                          context,
                          bodyWeightController,
                          pumpController,
                        );
                  },
                ),
              );
        },
      ),
    );
  }
}
