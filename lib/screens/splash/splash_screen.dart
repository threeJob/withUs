import 'package:flutter/material.dart';
import 'package:with_us/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kMainColor,
        body: Center(
            child: Image.asset(
          'assets/images/splash_logo.png',
          width: screenWidth * 0.6,
        )));
  }
}
