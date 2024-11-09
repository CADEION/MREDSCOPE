part of 'galllery_imports.dart';

class GallleryViewModel{

    final Repositories repositories;
  GallleryViewModel({required this.repositories});

  final VelocityBloc<GalleryModel> galleryModelBloc = VelocityBloc<GalleryModel>(GalleryModel());

  getImageData(BuildContext context) async {
    var imageData = await repositories.galleryRepo.getUserPosts();
    
      galleryModelBloc.onUpdateData(imageData);
    }
  }
