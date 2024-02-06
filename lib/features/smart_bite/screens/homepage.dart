import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../global/shared_preferences/shared_preferences.dart';
import '../../../utils/constants/color.dart';
import '../../auth/auth_view.dart';
import '../../auth/controllers/auth_controller.dart';

class HomePageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var widget;
    return PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
              backgroundColor: SmartBiteColor.primary,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ProfileScreen()),
                      // );
                      print('Hello');
                    },
                    child: const Image(
                      image: AssetImage("assets/images/profile.png"),
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Name and Email
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 3,
                  // ),
                  Text(
                    widget.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              title: Text(
                                "Log Out?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: Text(
                                "Are you sure you want to log out?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: ()  {
                                    // await _auth.signOut;
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.green),
                                  onPressed: () {
                                    AuthController authController = Get.put(AuthController());
                                    authController.logOut();
                                    SmartSharedPreferences.destroyValues();
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => const AuthView()));
                                  },
                                  child: Text(
                                    "Log Out",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.logout_outlined, color: SmartBiteColor.white,),
                ),
              ]),
        );
  }

}