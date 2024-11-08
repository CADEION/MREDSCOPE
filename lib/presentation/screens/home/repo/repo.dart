part of 'repo_imports.dart';

class Repo extends StatefulWidget {
  const Repo({super.key});

  @override
  State<Repo> createState() => _RepoState();
}

class _RepoState extends State<Repo> {
  late RepoViewModel repoViewModel;
  @override
  void initState() {
    repoViewModel = RepoViewModel(repositories: context.read<Repositories>());
    repoViewModel.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocBuilder<VelocityBloc<List<RepoModel>>,
                VelocityState<List<RepoModel>>>(
      bloc: repoViewModel.repoModelBloc,
      builder: (context, state) {
        if (state is VelocityInitialState) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is VelocityUpdateState) {
          return ListView.separated(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final repoData = state.data[index];
              return GestureDetector(
                onLongPress: (){
          //         Navigator.push(
          // context, MaterialPageRoute(builder: (context) => OwnerDetailScreen(ownerData: repoData,))
          // );
                },
                onTap: ()async{
                  showDialog(context: context, builder: (context){
                    return repoViewModel.SimpleDialogBox(repoData);
                  });
                },
                child: RepoCard(
                  repoName: repoData.owner!.login!,
                  createdAt: repoData.createdAt.toString(),
                  commentCount: repoData.comments!,
                  avatarUrl:
                      repoData.owner!.avatarUrl!,
                  description: state.data[index].description ?? 'No description',
                  updatedAt: repoData.updatedAt.toString(),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 30,
              );
            },
          );
        } else if (state is VelocityFailedState) {
          return Center(
            child: state.error.text.make(),
          );
        }
        return SizedBox(
          child: "data".text.make(),
        );
      },
    )));
  }
}
