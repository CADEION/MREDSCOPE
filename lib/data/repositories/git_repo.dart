import 'package:mredscope/data/datasources/remote/api_client.dart';
import 'package:mredscope/presentation/screens/home/repo/repo_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../datasources/remote/api_constants.dart';

class GitRepo extends ApiClient {
  Future<RepoModel> getAllRepos() async {
    try {
      final response = await getRequest(path: ApiConstants.mainUrl);
      if (response.statusCode == 200) {
        // final responseData = tagsModelFromJson(jsonEncode(response.data));

        final responseData = RepoModel.fromJson(response.data);
        return responseData;
      } else {
        return RepoModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      return RepoModel();
    }
  }
}