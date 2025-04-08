part of 'gallery_view_imports.dart';

@RoutePage()
class GalleryView extends StatefulWidget {
  final GalleryModel galleryModel;
  const GalleryView({super.key, required this.galleryModel});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(    
        scrolledUnderElevation: 0.0,
        title: Text(
          DateFormat("d MMM, yyyy").format(widget.galleryModel.date),
          style: TextStyle(
            color: MyColors.whiteText,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                context.router.push(
                  GalleryViewDetailsRoute(galleryModel: widget.galleryModel),
                );
              },
              icon: Icon(
                Icons.info_outline,
                color: MyColors.whiteText,
                size: 27.r,
              ),
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.primaryCharcoal,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4,
          child: SizedBox.expand(
            child: Image.file(
               errorBuilder: (context,error,stackTrace) {
                                    return Center(child: Icon(Icons.image_not_supported_outlined,color: MyColors.whiteText,),);
                                  },
              File(widget.galleryModel.imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.h,
        color: MyColors.primaryCharcoal,
        child: Consumer<GalleryViewProvider>(
          builder: (context, galleryProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                galleryProvider.isUpdateLoading
                    ? CircularProgressLoading()
                    : IconButton(
                      onPressed: () {
                        galleryProvider.updateProgress(
                          widget.galleryModel,
                          context,
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 27.sp,
                        color: MyColors.whiteText,
                      ),
                    ),
                galleryProvider.isDeleteLoading
                    ? CircularProgressLoading()
                    : IconButton(
                      onPressed: () {
                        galleryProvider.deleteProgress(
                          widget.galleryModel.id!,
                          context,
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 27.sp,
                        color: MyColors.whiteText,
                      ),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
