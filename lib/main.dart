import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bite/features/auth/auth_view.dart';
import 'package:smart_bite/global/shared_preferences/shared_preferences.dart';
import 'package:smart_bite/utils/constants/color.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.id,
      required this.name,
      required this.email});

  final String title;
  final String id;
  final String name;
  final String email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int myIndex = 1;
  get preferredSize => null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: SmartBiteColor.primary),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(widget.id),
            Text(widget.name),
            Text(widget.email),
            ElevatedButton(
                onPressed: () {
                  // showToast(message: "Hello");
                },
                child: Text('press'))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            myIndex = index;
            print(index);
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: SmartBiteColor.white,
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Iconsax.bookmark), label: "Food Tracker"),
          BottomNavigationBarItem(icon: Icon(Iconsax.coffee), label: "Recipe"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
