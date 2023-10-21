import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test2/Final_Project/View/Screens/Auth/sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Lottie.asset("assets/splash.json")),
          Expanded(
            flex: 1,
            child: AnimatedSplashScreen.withScreenFunction(
              splash:const Text("Choose Your Car" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xCDB50e03),)),
              screenFunction: () async {

                return SignUp();
              },
              splashTransition: SplashTransition.rotationTransition,
            ),
          )
        ],
      ),
    );
  }
}