import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/data/models/gallery_model.dart';
import 'package:fitlifts/presentation/common_widgets/datetime_widget.dart';
import 'package:fitlifts/presentation/common_widgets/elevated_cta.dart';
import 'package:fitlifts/presentation/common_widgets/num_field.dart';
import 'package:fitlifts/presentation/screens/gallery_view/add_progress_image/add_progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/my_colors.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(9.w, 15.h, 9.w, 25.w),
        child: Column(
          children: [
            NumField(
              controller: bodyWeightController,
              hintText: "Current Body Weight",
              labelTitle: "Body Weight",
              maxLength: 5,
            ),
            SizedBox(height: 25.h),
            NumField(
              controller: pumpController,
              hintText: "Rate Body Pump",
              labelTitle: "Body Pump",
              maxLength: 2,
            ),
            SizedBox(height: 25.h),
            DateTimeWidget(showDate: false),
            SizedBox(height: 30.h),
            Spacer(),
            Consumer<AddProgressProvider>(
              builder: (context, addProgressProvider, child) {
                return addProgressProvider.isLoading
                    ? Center(
                      child: LoadingAnimationWidget.waveDots(
                        color: MyColors.whiteText,
                        size: 40.r,
                      ),
                    )
                    : ElevatedCTA(
                      title: widget.isUpdate ? "Update" : 'Save',
                      onPressed: () {
                        widget.isUpdate
                            ? addProgressProvider.updateProgress(
                              GalleryModel(
                                id : widget.galleryModel!.id,
                                imagePath: widget.galleryModel!.imagePath,
                                date: widget.galleryModel!.date,
                                bodyWeight: double.tryParse(
                                  bodyWeightController.text,
                                ),
                                ratePump: int.tryParse(pumpController.text),
                              ),
                              context,
                            )
                            : addProgressProvider.createProgress(
                              GalleryModel(
                                id : widget.galleryModel!.id,
                                imagePath: widget.imagePath!,
                                date: DateTime.now(),
                                bodyWeight: double.tryParse(
                                  bodyWeightController.text.trim(),
                                ),
                                ratePump: int.tryParse(
                                  pumpController.text.trim(),
                                ),
                              ),
                              context,
                            );
                      },
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
