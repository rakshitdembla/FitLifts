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
      isGalleryLoaded = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<GalleryProvider>(context, listen: false).getAllGallery();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenwidth)/3;
    final itemHeight = itemWidth * (85 / 80);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: false,
        title: Text(
          "My Fitness Journey",
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
            fontSize: 19.sp,
          ),
        ),
        actions: [
          CustomDropDown(
            style: GoogleFonts.poppins(
              color: MyColors.greyText,
              fontSize: 13.sp,
            ),
            hintText: "Sort by",
            items: [
              DropdownMenuItem<String>(value: "latest", child: Text("Latest")),
              DropdownMenuItem<String>(value: "oldest", child: Text("Oldest")),
              DropdownMenuItem<String>(
                value: "highestWeight",
                child: Text("Highest Weight"),
              ),
              DropdownMenuItem<String>(
                value: "lowestWeight",
                child: Text("Lowest Weight"),
              ),
              DropdownMenuItem<String>(value: "pump", child: Text("Pump")),
            ],
            value:
                Provider.of<GalleryProvider>(
                  context,
                  listen: true,
                ).selectedSortOption,
            onChanged: (value) {
              if (value != null) {
                Provider.of<GalleryProvider>(
                  context,
                  listen: false,
                ).updateSort(value);
              }
            },
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 55.h,
        width: 60.w,
        child: FloatingActionButton(
          heroTag: "galleryhero",
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
          padding: EdgeInsets.fromLTRB(10.w, 3.h, 10.w, 8.h),
          physics: AlwaysScrollableScrollPhysics(),
          child: Consumer<GalleryProvider>(
            builder: (ctx, galleryProvider, child) {
              if (galleryProvider.isLoading) {
                return SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      kBottomNavigationBarHeight -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top,
                  child: CircularProgressLoading()
                );
              } else {
                return galleryProvider.imagesList.isEmpty
                    ? SizedBox(
                      height:
                          MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          kBottomNavigationBarHeight ,
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
                    : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 5.h,
                        childAspectRatio: itemWidth/itemHeight
                      ),
                      itemBuilder: (ctx, index) {
                        GalleryModel galleryModel =
                            galleryProvider.imagesList[index];
                        return InkWell(
                          onTap: () {
                            context.router.push(
                              GalleryViewRoute(galleryModel: galleryModel),
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
                                      borderRadius: BorderRadius.circular(7.r),
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
                    );
              }
            },
          ),
        ),
      ),
    );
  }
}
