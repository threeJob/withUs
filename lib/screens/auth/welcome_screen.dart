import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:dio/dio.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/screens/auth/auth_screen.dart';
import 'package:with_us/screens/home/home_screen.dart';
import 'package:with_us/widgets/rounded_button.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class WelcomeScreen extends StatelessWidget {
  get json => null;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset(
                "assets/images/logo.png",
                width: screenWidth * 0.5,
              ),
              SizedBox(height: screenHeight * 0.15),
              const Text("반갑습니다 ,",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const Text("@화이트하임님",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.15),
              RoundedButtonForDialog(
                url: " ",
                text: "시작하기",
                borderSize: 15,
                color: KGreyColor,
                textColor: Colors.white,
                borderColor: Colors.grey.withOpacity(0.3),
                press: () {
                  // kakaoLogin();
                  Get.to(() => HomeScreen());
                },
              ),
            ],
          ),
        ));
  }
}
