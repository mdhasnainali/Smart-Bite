import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bite/main.dart';

import '../../features/onboarding/screens/onboarding_screen.dart';

class SmartSharedPreferences{
  static Future<void> setAuthValues(id, name, email) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('user-id', id);
    prefs.setString('user-name', name);
    prefs.setString('user-email', email);
  }

  static Future<void> getAuthValues(context) async {
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('user-name') != null ? prefs.getString('user-name'): 'null';
    var id = prefs.getString('user-id') != null ? prefs.getString('user-id'): 'null';
    var email = prefs.getString('user-email') != null ? prefs.getString('user-email'): 'null';

    print(id! + name! + email!);
    if(id == 'null'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnBoardingScreen()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "hello", id: id.toString(), name: name.toString(), email: email.toString())));
    }
  }

  static Future<void> destroyValues() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("user-id");
    prefs.remove("user-name");
    prefs.remove("user-email");
    prefs.clear();
  }
}