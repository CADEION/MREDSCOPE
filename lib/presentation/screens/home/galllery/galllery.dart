part of 'galllery_imports.dart';

class Galllery extends StatefulWidget {
  const Galllery({super.key});

  @override
  State<Galllery> createState() => _GallleryState();
}

class _GallleryState extends State<Galllery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepoCard(
      repoName: 'rustrover v2024.2',
      createdAt: '2024-11-07T16:07:43Z',
      commentCount: 69,
      avatarUrl: 'https://avatars.githubusercontent.com/u/6270979?v=4',
      description: 'rustrover v2024.2 - Failed - Package Tests Results',
      updatedAt: '2024-11-07T16:07:43Z',
    ));
  }
}
