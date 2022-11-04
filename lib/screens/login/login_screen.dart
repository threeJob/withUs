import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:dio/dio.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/widgets/rounded_button.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class LoginScreen extends StatelessWidget {
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
          leading: IconButton(
            icon: Image.asset(
              "assets/images/back_icon.png",
              width: screenWidth * 0.06,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Image.asset(
                "assets/images/logo.png",
                width: screenWidth * 0.5,
              ),
              const SizedBox(height: 5),
              const Text("함께하는 공부 플랫폼",
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.1),
              RoundedButtonForDialog(
                url: "assets/images/kakao_logo.png",
                text: "카카오톡으로 로그인하기",
                color: Colors.white,
                textColor: kMainColor,
                borderColor: Colors.grey,
                press: () {
                  Get.to(() => LoginScreen());
                },
              ),
              RoundedButtonForDialog(
                url: "assets/images/naver_logo.png",
                text: "네이버로 로그인하기",
                color: Colors.white,
                textColor: kMainColor,
                borderColor: Colors.grey,
                press: () {
                  Get.to(() => LoginScreen());
                },
              ),
              RoundedButtonForDialog(
                url: "assets/images/google_logo.png",
                text: "Google로 로그인하기",
                color: Colors.white,
                textColor: kMainColor,
                borderColor: Colors.grey,
                press: () {
                  Get.to(() => LoginScreen());
                },
              ),
              RoundedButtonForDialog(
                url: "assets/images/apple_logo.png",
                text: "Apple ID로 로그인하기",
                color: Colors.white,
                textColor: kMainColor,
                borderColor: Colors.grey,
                press: () {
                  Get.to(() => LoginScreen());
                },
              ),
            ],
          ),
        ));
  }
}
