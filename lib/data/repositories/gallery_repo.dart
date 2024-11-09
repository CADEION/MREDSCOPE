import 'dart:convert';

// import 'package:mredscope/data/datasources/remote/api_client.dart';
import 'package:flutter/material.dart';
import 'package:mredscope/data/models/gallery_list.dart';
import 'package:mredscope/presentation/screens/home/galllery/galllery_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../datasources/remote/api_client_image.dart';
import '../datasources/remote/api_constants.dart';

class GalleryRepo extends ApiClientImage {
 Future<List<GalleryModel>> getUserPosts() async {
  try {
    final response = await getImageRequest(
      path: ApiConstants.secUrl,
      isTokenRequired: true,
    );

    // Debug logging
    Vx.log('Response Status Code: ${response.statusCode}');
    
    if (response.statusCode == 200) {
      final body = response.data;

      // Debug logging
      debugPrint('Raw Data received: $body');

      if (body is List && body.isNotEmpty) {
        // Directly map the list response to the model list
        final galleryModelList = galleryModelFromJson(jsonEncode(body));

        // Debug logging
        debugPrint('Successfully parsed ${galleryModelList.length} items');

        return galleryModelList;
      } else {
        Vx.log('Response body is empty or not in expected format');
        return GalleryList.galleryCharList;
      }
    } else {
      Vx.log('Failed to fetch photos. Status code: ${response.statusCode}');
      return GalleryList.galleryCharList;
    }
  } catch (e, stackTrace) {
    Vx.log('Error fetching photos: $e');
    debugPrint('Stack trace: $stackTrace');
    return GalleryList.galleryCharList;
  }
}


  // Helper method
  int min(int a, int b) => a < b ? a : b;
}

// Extension to help with null safety
extension SafeMapExtension on Map {
  Map<String, dynamic> toSafeMap() {
    return Map<String, dynamic>.from(this);
  }
}