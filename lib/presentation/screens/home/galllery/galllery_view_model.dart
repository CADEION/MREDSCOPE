part of 'galllery_imports.dart';

class GallleryViewModel {
  final Repositories repositories;
  
  GallleryViewModel({required this.repositories});

  final VelocityBloc<List<GalleryModel>> galleryModelBloc = VelocityBloc<List<GalleryModel>>([]);

  Future<void> getImageData(BuildContext context) async {
    try {
      final galleryData = await repositories.galleryRepo.getUserPosts();
      
      // Log gallery data length instead of full data for readability
      Vx.log('Gallery data retrieved with ${galleryData.length} items.');
      galleryModelBloc.onUpdateData(galleryData);
    } catch (e) {
      // Enhanced error logging
      Vx.log('Error in getImageData: $e');
    }
  }
}
