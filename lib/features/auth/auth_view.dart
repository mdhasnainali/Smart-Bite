import 'package:flutter/material.dart';
import 'package:smart_bite/features/auth/screens/login_screen.dart';
import 'package:smart_bite/features/auth/screens/sing_up_screen.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _MainViewState();
}

class _MainViewState extends State<AuthView> {
  PageController auth_controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        controller: auth_controller,
        itemBuilder: (context, index) {
          if (index == 0) {
            return LoginScreen(
              controller: auth_controller,
            );
          } else if (index == 1) {
            return SingUpScreen(
              controller: auth_controller,
            );
          }
        },
      ),
    );
  }
}
