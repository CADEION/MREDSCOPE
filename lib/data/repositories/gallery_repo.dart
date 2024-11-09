import 'dart:convert';

// import 'package:mredscope/data/datasources/remote/api_client.dart';
import 'package:mredscope/presentation/screens/home/galllery/galllery_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../datasources/remote/api_client_image.dart';
import '../datasources/remote/api_constants.dart';

class GalleryRepo extends ApiClientImage {
  Future<GalleryModel> getUserPosts() async {
    try {
      final response = await getImageRequest(
          path: ApiConstants.secUrl, isTokenRequired: true);
      if (response.statusCode == 200) {
        final body = response.data;
        Vx.log('This is body :${body.toString().substring(300)}');
        final responseData = galleryModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        GalleryModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      GalleryModel();
    }
    return GalleryModel();
  }
}
