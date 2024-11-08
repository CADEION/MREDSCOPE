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
            child:
                BlocBuilder<VelocityBloc<RepoModel>, VelocityState<RepoModel>>(
      bloc: repoViewModel.repoModelBloc,
      builder: (context, state) {
        if (state is VelocityInitialState) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is VelocityUpdateState) {
          return ListView.separated(
            itemCount: 6,
            itemBuilder: (context, index) {
              return RepoCard(
                repoName: 'rustrover v2024.2',
                createdAt: '2024-11-07T16:07:43Z',
                commentCount: 69,
                avatarUrl:
                    'https://avatars.githubusercontent.com/u/6270979?v=4',
                description:
                    state.data.description!,
                updatedAt: '2024-11-07T16:07:43Z',
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
