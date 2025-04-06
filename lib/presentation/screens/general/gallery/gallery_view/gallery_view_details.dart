import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/presentation/common_widgets/elevated_cta.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../../data/models/gallery_model.dart';

@RoutePage()
class GalleryViewDetails extends StatelessWidget {
  final GalleryModel galleryModel;

  const GalleryViewDetails({super.key, required this.galleryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.primaryCharcoal,
        iconTheme: IconThemeData(color: MyColors.whiteText),
        title: Text(
          'Progress Details',
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 25.h, 12.w, 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Created on:",
                  style: TextStyle(color: MyColors.greyText, fontSize: 16.sp),
                ),
                Text(
                  DateFormat('hh:mm a | yyyy MMM dd').format(galleryModel.date),
                  style: TextStyle(color: MyColors.greyText, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rated pump:",
                  style: TextStyle(color: MyColors.greyText, fontSize: 16.sp),
                ),
                Text(
                  "${galleryModel.ratePump.toString()}/10",
                  style: TextStyle(color: MyColors.greyText, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Body weight:",
                  style: TextStyle(color: MyColors.greyText, fontSize: 16.sp),
                ),
                Text(
                 "${ galleryModel.bodyWeight.toString()} kg",
                  style: TextStyle(color: MyColors.greyText, fontSize: 16.sp),
                ),
              ],
            ),
            Spacer(),
            ElevatedCTA(
              title: "Update",
              onPressed: () {
                context.router.push(
                  AddProgressRoute(isUpdate: true, galleryModel: galleryModel),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
