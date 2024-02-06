import 'package:flutter/material.dart';
import 'package:smart_bite/features/auth/auth_view.dart';
import 'package:smart_bite/main.dart';
import 'package:smart_bite/utils/constants/color.dart';
import 'package:smart_bite/utils/constants/onboard.dart';
import '../wizards/dot_indicator.dart';
import '../wizards/onboard_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60,),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('SmartBite', style: TextStyle(
                fontSize: 35,
                color: SmartBiteColor.primary,
                fontWeight: FontWeight.w800,
              ),),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: OnBoard.onboard_data.length,
                controller: _pageController,
                  onPageChanged: (index){
                  setState(() {
                    _pageIndex = index;
                  });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: OnBoard.onboard_data[index].image,
                    title: OnBoard.onboard_data[index].title,
                    description: OnBoard.onboard_data[index].description,
                  ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(OnBoard.onboard_data.length, (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: DotIndicator(isActive: index == _pageIndex,),
              ))
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  if(_pageIndex == OnBoard.onboard_data.length - 1) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const AuthView()));

                  }
                  else{
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: SmartBiteColor.primary,
                  // shadowColor: row
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white,),
              ),
            ),
            const SizedBox(height: 70,)
          ],
        )
      ),
    );
  }
}

