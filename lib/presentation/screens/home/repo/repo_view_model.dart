part of 'repo_imports.dart';

class RepoViewModel{
  final Repositories repositories;

  RepoViewModel({required this.repositories});

  VelocityBloc<RepoModel> repoModelBloc = VelocityBloc<RepoModel>(RepoModel());
  
  fetchAllPosts() async {
  try {
    var repoData = await repositories.gitRepo.getAllRepos();
    Vx.log(repoData);
    if (repoData.id != null) {
      repoModelBloc.onUpdateData(repoData);
    }
  } catch (e) {
    Vx.log('Error fetching posts: $e');
  }
}


}