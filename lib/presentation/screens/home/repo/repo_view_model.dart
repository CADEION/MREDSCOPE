part of 'repo_imports.dart';

class RepoViewModel {
  final Repositories repositories;

  RepoViewModel({required this.repositories});

  VelocityBloc<List<RepoModel>> repoModelBloc =
      VelocityBloc<List<RepoModel>>([]);

  fetchAllPosts() async {
    try {
      var postsData = await repositories.gitRepo.getAllRepos();
      Vx.log('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
      Vx.log(postsData);
      Vx.log('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
      repoModelBloc.onUpdateData(postsData);
      // if (postsData.status == 1) {

      // }
    } catch (e) {
      Vx.log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      Vx.log('Error fetching posts: $e');
      Vx.log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    }
  }
}
