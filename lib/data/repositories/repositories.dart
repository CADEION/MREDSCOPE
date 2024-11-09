import 'package:mredscope/data/repositories/gallery_repo.dart';
import 'package:mredscope/data/repositories/git_repo.dart';

class Repositories {
  
  final GitRepo gitRepo;
  final GalleryRepo galleryRepo;

  Repositories({required this.gitRepo,required this.galleryRepo});
}