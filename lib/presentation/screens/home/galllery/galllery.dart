part of 'galllery_imports.dart';

class Galllery extends StatefulWidget {
  const Galllery({super.key});

  @override
  State<Galllery> createState() => _GallleryState();
}

class _GallleryState extends State<Galllery> {
  late GallleryViewModel gallleryViewModel;

  @override
  void initState() {
    gallleryViewModel = GallleryViewModel(repositories: context.read<Repositories>());
    gallleryViewModel.getImageData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<VelocityBloc<List<GalleryModel>>,
              VelocityState<List<GalleryModel>>>(
        bloc: gallleryViewModel.galleryModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final galleryData = state.data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Card(
                      child: Image(
                        image: NetworkImage(galleryData.urls!.regular!),height: 200, fit: BoxFit.cover,
                      ).cornerRadius(10),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemCount: state.data.length);
          } else if (state is VelocityFailedState) {
            return Center(
              child: state.error.text.make(),
            );
          }
          return SizedBox(
            child: "data".text.make(),
          );
        },
      )),
    );
  }
}
