import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/screens/login/login_screen.dart';
import 'package:with_us/widgets/rounded_button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 36,
          centerTitle: false,
          backgroundColor: kMainColor,
          title: const Text("안녕하세요",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Amaranth",
                  fontWeight: FontWeight.bold)),
        ),
        body: Center(
            child: Column(
          children: [
            Stack(children: [
              Image.asset(
                'assets/images/first_app_bar.png',
                width: screenWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36, top: 5),
                child: RichText(
                  text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "함께하는 공부 플랫폼\n\n",
                        ),
                        TextSpan(text: "withUs 에 오신 것을 환영합니다.\n"),
                      ],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Amaranth")),
                ),
              )
            ]),
            SizedBox(height: screenHeight * 0.1),
            Image.asset(
              'assets/images/first_content_01.png',
              width: screenWidth * 0.6,
            ),
            const Text("스퍼디카페에 온 것처럼 공부해보세요"),
            SizedBox(height: screenHeight * 0.13),
            RoundedButtonForDialog(
              text: "새로 시작하기",
              press: () => Get.to(() => LoginScreen()),
            ),
            SizedBox(height: screenHeight * 0.005),
            RoundedButtonForDialog(
              text: "로그인하기",
              press: () => Get.to(() => LoginScreen()),
            )
          ],
        )));
  }
}
