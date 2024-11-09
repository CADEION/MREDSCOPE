part of 'image_screen_imports.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.galleryData});
  final GalleryModel galleryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite)).pSymmetric(h: 10)
        ],
      ),
        body: PhotoView(
      imageProvider: NetworkImage(
        galleryData.urls!.full!,
      ),
      // Contained = the smallest possible size to fit one dimension of the screen
      minScale: PhotoViewComputedScale.contained * 0.8,
      // Covered = the smallest possible size to fit the whole screen
      maxScale: PhotoViewComputedScale.covered * 2,
      enableRotation: true,
      // Set the background color to the "classic white"
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      loadingBuilder: (context, widget) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
