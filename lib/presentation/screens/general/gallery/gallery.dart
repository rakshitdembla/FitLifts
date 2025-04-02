part of "gallery_imports.dart";

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (ctx, galleryProvider, child) {
        return Scaffold(
          floatingActionButton: SizedBox(
            height: 65,
            width: 65,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),

              onPressed: () {
                galleryProvider.captureImage(ctx);
              },
              child: Icon(
                Icons.camera_alt_outlined,
                color: MyColors.primaryCharcoal,
                size: 24.r,
              ),
            ),
          ),
          backgroundColor: MyColors.primaryCharcoal,
          body:
              galleryProvider.isLoading
                  ? Center(
                    child: LoadingAnimationWidget.waveDots(
                      color: MyColors.whiteText,
                      size: 40.r,
                    ),
                  )
                  : galleryProvider.imagesList.isEmpty
                  ? Center(
                    child: Text(
                      "No Progress Images Found!",
                      style: TextStyle(
                        color: MyColors.greyText,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 0),
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SortBar(
                              title: "My Fitness Journey",
                              showDropdown: true,
                            ),
                            SizedBox(height: 12.h),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.w,
                                    mainAxisSpacing: 5.h,
                                    childAspectRatio: 1.0,
                                  ),
                              itemBuilder: (ctx, index) {
                                GalleryModel galleryModel =
                                    galleryProvider.imagesList[index];
                                return InkWell(
                                  onTap: () {
                                    context.router.push(
                                      GalleryViewRoute(
                                        galleryModel: galleryModel,
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          15.r,
                                        ),
                                        child: Image.file(
                                          File(galleryModel.imagePath),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.65,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 7.w,
                                              vertical: 4.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: MyColors.primaryBlack,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Text(
                                              "B.W - ${galleryModel.bodyWeight}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: MyColors.primaryWhite,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: galleryProvider.imagesList.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
        );
      },
    );
  }
}
