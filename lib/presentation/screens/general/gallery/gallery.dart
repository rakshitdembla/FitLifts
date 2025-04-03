part of "gallery_imports.dart";

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool isGalleryLoaded = false;

  @override
  void didChangeDependencies() {
    if (!isGalleryLoaded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<GalleryProvider>(context, listen: false).getAllGallery();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 55.h,
        width: 60.w,
        child: FloatingActionButton(
          heroTag: "herotag",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),

          onPressed: () {
            Provider.of<GalleryProvider>(
              context,
              listen: false,
            ).captureImage(context);
          },
          child: Icon(
            Icons.camera_alt_outlined,
            color: MyColors.primaryCharcoal,
            size: 24.r,
          ),
        ),
      ),
      backgroundColor: MyColors.primaryCharcoal,
      body: RefreshBar(
        onRefresh: () {
          return Provider.of<GalleryProvider>(context, listen: false).refresh();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 8.h),
          physics: AlwaysScrollableScrollPhysics(),
          child: Consumer<GalleryProvider>(
            builder: (ctx, galleryProvider, child) {
              if (galleryProvider.isLoading) {
                return SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      kBottomNavigationBarHeight,
                  child: Center(
                    child: CircularProgressIndicator(color: MyColors.whiteText),
                  ),
                );
              } else {
                return galleryProvider.imagesList.isEmpty
                    ? SizedBox(
                      height:
                          MediaQuery.of(context).size.height -
                          kBottomNavigationBarHeight,
                      child: Center(
                        child: Text(
                          "No Progress Images Found!",
                          style: TextStyle(
                            color: MyColors.greyText,

                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    : SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SortBar(
                            items: [
                              DropdownMenuItem(
                                value: "latest",
                                child: Text("Latest"),
                              ),
                              DropdownMenuItem(
                                value: "oldest",
                                child: Text("Oldest"),
                              ),
                              DropdownMenuItem(
                                value: "highestWeight",
                                child: Text("Highest Weight"),
                              ),
                              DropdownMenuItem(
                                value: "lowestWeight",
                                child: Text("Lowest Weight"),
                              ),
                              DropdownMenuItem(
                                value: "pump",
                                child: Text("Pump"),
                              ),
                            ],
                            value: galleryProvider.selectedSortOption,
                            onChanged: (value) {
                              if (value != null) {
                                galleryProvider.updateSort(value);
                              }
                            },
                            title: "My Fitness Journey",
                            showDropdown: true,
                          ),
                          SizedBox(height: 13.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5.w,
                                  mainAxisSpacing: 5.h,
                                  childAspectRatio: (85.w/80.h),
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
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: Image.file(
                                        File(galleryModel.imagePath),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.65,
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                            vertical: 3.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: MyColors.primaryBlack,
                                            borderRadius: BorderRadius.circular(
                                              7.r,
                                            ),
                                          ),
                                          child: Text(
                                            "${galleryModel.bodyWeight} Kg",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: MyColors.primaryWhite,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 9.sp,
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
                    );
              }
            },
          ),
        ),
      ),
    );
  }
}
