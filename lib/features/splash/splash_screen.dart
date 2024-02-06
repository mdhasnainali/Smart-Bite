import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bite/features/auth/screens/login_screen.dart';
import 'package:smart_bite/features/onboarding/screens/onboarding_screen.dart';
import 'package:smart_bite/global/shared_preferences/shared_preferences.dart';
import 'package:smart_bite/main.dart';
import 'package:smart_bite/utils/constants/color.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), (){
      SmartSharedPreferences.getAuthValues(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SmartBiteColor.primary,
        child: Center(child: const Text('SmartBite', style: TextStyle(
          fontSize: 40,
          color: SmartBiteColor.white,
          fontWeight: FontWeight.w900,
        ),)),
      ),
    );
  }
}