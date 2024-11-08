import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mredscope/data/repositories/git_repo.dart';
import 'package:mredscope/data/repositories/repositories.dart';
import 'package:mredscope/presentation/screens/splash/splash_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    RepositoryProvider(
      create: (context) => Repositories(gitRepo: GitRepo()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'First Method',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Splash(),
          );
        });
  }
}
