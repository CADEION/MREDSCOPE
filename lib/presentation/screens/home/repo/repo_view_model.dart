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

  Widget SimpleDialogBox(repoData){
    return Dialog(
      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 500,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.h.heightBox,
                    Image(
                      image: NetworkImage(repoData.owner!.avatarUrl!),
                      fit: BoxFit.contain,
                      height: 70,
                    ).cornerRadius(80),
                    10.h.heightBox,
                    'Owner\'s Name : ${repoData.owner!.login}'
                        .text
                        .bold
                        .xl2
                        .letterSpacing(1)
                        .make(),
                    5.h.heightBox,
                    'Owner\'s url :\n ${repoData.owner!.url}'
                        .text
                        .bold
                        .xl
                        .letterSpacing(1)
                        .make(),
                    8.h.heightBox,
                    'Owner\'s followers_url :\n ${repoData.owner!.followersUrl}'
                        .text
                        .bold
                        .xl
                        .letterSpacing(1)
                        .make(),
                    8.h.heightBox,
                    'Owner\'s following_url :\n ${repoData.owner!.followingUrl}'
                        .text
                        .bold
                        .xl
                        .letterSpacing(1)
                        .make(),
                    10.h.heightBox,
                    'Owner\'s user_view_type : ${repoData.owner!.userViewType}'
                        .text
                        .bold
                        .xl
                        .letterSpacing(1)
                        .make(),
                  ],
                ),
              ),
            ),
    );
  }

}
