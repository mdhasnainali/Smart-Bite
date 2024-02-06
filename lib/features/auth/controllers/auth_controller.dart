import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bite/global/shared_preferences/shared_preferences.dart';
import 'package:smart_bite/main.dart';

class AuthController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future <void> signUpWithEmailAndPass(context) async {
    String? email = emailController.text;
    final password = passwordController.text;
    String? name = nameController.text;

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      final user = credential.user;
      await user?.updateDisplayName(name);

      print(credential);

      final id = credential.user?.uid;
      email = credential.user?.email;
      print(id! + name + email!);

      SmartSharedPreferences.setAuthValues(id, name, email);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Hello', id: id.toString(), email:email.toString(), name: name.toString())));

      print("Successfully Registered: $credential");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    nameController.text = '';
    passwordController.text = '';
    emailController.text = '';
  }

  Future <void> logInWithEmailAndPass(context) async{
    String? email = emailController.text;
    final password = passwordController.text;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        // Trigger the authentication Email & Password(
        email: email,
        password: password,
      );
      print(credential);

      final id = credential.user?.uid;
      String? name = credential.user?.displayName;
      email = credential.user?.email;

      if(name == null) name = 'null';

      print(id! + name! + email!);
      SmartSharedPreferences.setAuthValues(id, name, email);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Hello',id: id.toString(), name: name.toString(), email: email.toString(),)));

      print('Login Successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    nameController.text = '';
    passwordController.text = '';
    emailController.text = '';
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signInWithGoogle(context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userInfo = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userInfo.user);
    print("Successfully Signed Up");
    var id = userInfo.user?.uid;
    var name = userInfo.user?.displayName;
    var email = userInfo.user?.email;
    SmartSharedPreferences.setAuthValues(id, name, email);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Hello', id: id.toString(), name: name.toString(), email: email.toString(),)));
  }
}