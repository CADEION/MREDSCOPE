import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mredscope/data/datasources/remote/api_client.dart';
import 'package:mredscope/data/models/repo_list.dart';
import 'package:mredscope/presentation/screens/home/repo/repo_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../datasources/remote/api_constants.dart';

class GitRepo extends ApiClient {
  Future<List<RepoModel>> getAllRepos() async {
    try {
      final response = await getRequest(path: ApiConstants.mainUrl);
      
      // Debug logging
      Vx.log('Response Status Code: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final body = response.data;
        
        // Debug logging
        debugPrint('Raw Data received: $body');
        Vx.log('DATA: $body');

        if (body is List && body.isNotEmpty) {
          try {
            // Convert each map in the list to ensure proper structure
            final List<Map<String, dynamic>> properJson = body.map((item) {
              if (item is Map) {
                return Map<String, dynamic>.from(item);
              }
              throw FormatException('Invalid item format in response');
            }).toList();

            // Convert to JSON string with proper handling
            final jsonString = jsonEncode(properJson);
            
            // Debug logging
            debugPrint('Formatted JSON: ${jsonString.substring(0, min(100, jsonString.length))}...');
            
            // Parse the JSON string
            final repoModelList = repoModelFromJson(jsonString);
            
            // Debug logging
            debugPrint('Successfully parsed ${repoModelList.length} repositories');
            
            return repoModelList;
          } catch (parseError) {
            debugPrint('Parse error: $parseError');
            Vx.log('Parse error details: $parseError');
            return RepoList.RepoCharList;
          }
        } else {
          Vx.log('Response body is not a valid list or is empty');
          return RepoList.RepoCharList;
        }
      } else {
        Vx.log('Failed to fetch repos. Status code: ${response.statusCode}');
        return RepoList.RepoCharList;
      }
    } catch (e, stackTrace) {
      Vx.log('Error fetching repos: $e');
      debugPrint('Stack trace: $stackTrace');
      return RepoList.RepoCharList;
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