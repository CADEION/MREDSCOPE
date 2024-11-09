part of 'splash_imports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToOnboard();
    super.initState();
  }

  moveToOnboard() async {
    await Future.delayed(const Duration(seconds: 2), () {
      // Utils.manipulateLogin(context);
      // AutoRouter.of(context).push(OnboardRoute());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFE5F55),
      body: Center(
        child: Image(image: AssetImage(MyAssets.assetsImagesRedLogo,),height: 400,).cornerRadius(50)
      ),
    );
  }
}
