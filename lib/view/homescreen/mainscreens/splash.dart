import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/app_colors.dart';
import '../../../common/textconstants.dart';
import 'firstscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() =>  FirstScreen(companyName: 'aswinstore'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromARGB(255, 122, 243, 122),
      body: Container(
        decoration:  BoxDecoration(
          gradient:  LinearGradient(
            colors: [Color(0xff004336).withOpacity(0.74), Color(0xff6EBC35)],
            stops: [0.0, 1.0],

            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        // stops: [0.0, 1.0],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Image.asset(
                'assets/logo.png', // Replace with your image path
                height: 180, // Adjust image size as needed
              ),

              Text(
                "BIZ HINGE",
                style: NeededTextstyles.splash,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
