import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notepad/view/home.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomeScreen(),
    )));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
            'assets/animation/Animation - 1698747719171.json'),
      ),
    );
  }
}