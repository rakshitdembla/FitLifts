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
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info_outline,
              color: MyColors.whiteText,
              size: 27.r,
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.primaryCharcoal,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),
      body: Center(
        child: Image.asset(Assets.assetsRawWeights, fit: BoxFit.contain),
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColors.primaryCharcoal,
        child: Consumer<GalleryViewProvider>(
          builder: (context, galleryProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                galleryProvider.isUpdateLoading
                    ? CircularProgressIndicator(color: MyColors.whiteText)
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
                    ? CircularProgressIndicator(color: MyColors.whiteText)
                    : IconButton(
                      onPressed: () {
                        galleryProvider.deleteProgress(
                          widget.galleryModel.id,
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
