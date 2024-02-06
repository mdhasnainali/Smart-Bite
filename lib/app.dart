import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_bite/utils/constants/color.dart';
import 'features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SmartBiteColor.primary),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}