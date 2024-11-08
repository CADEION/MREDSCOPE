import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_constants.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstants.mainUrl);
    dio = Dio(baseOptions);
  }

  Options options = Options();

  /// GET REQUEST
  Future<Response> getRequest({required String path}) async {
    try {
      debugPrint("🚀============API REQUEST============🚀");
      final requestUrl = baseOptions.baseUrl;
      debugPrint("Request Url: $requestUrl");
      debugPrint("Request Headers: ${options.headers}"); // Log request headers

      // Make the API request
      var response = await dio.get(path, options: options);

      debugPrint("🔥============API RESPONSE============🔥");
      debugPrint("Status Code: ${response.statusCode}");

      final dataString = response.data.toString();
      log("DATA: ${dataString.length > 300 ? dataString.substring(0, 300) : dataString}");

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("Error Response Data: ${e.response!.data}");
        debugPrint("Error Response Headers: ${e.response!.headers}");
        debugPrint("Error Request Options: ${e.response!.requestOptions}");
        throw ApiException(message: e.response!.statusMessage);
      } else {
        // Handle request setup errors
        debugPrint("Request Options: ${e.requestOptions}");
        debugPrint("Error Message: ${e.message}");
        throw ApiException(message: e.message);
      }
    }
  }
}
