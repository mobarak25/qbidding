import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/features/app/presentation/splash/view/splash_screen.dart';

void main() {
  configureDependencies();
  initGetStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qbidding',
      theme: ThemeData(fontFamily: 'montserrat'),
      home: const SplashScreen(),
      navigatorKey: getIt<IFlutterNavigator>().navigatorKey,
    );
  }
}

Future<void> initGetStorage() async {
  await GetStorage.init();
}
