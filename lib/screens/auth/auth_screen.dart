import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:dio/dio.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/screens/auth/user_screen.dart';
import 'package:with_us/widgets/rounded_button.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  get json => null;

  final phoneController = TextEditingController(); // 휴대폰 입력을 위한 controller
  final otpController = TextEditingController(); // 인증번호 입력을 위한 controller

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // Scaffold의 body나 floating button이 가려지는 것을 막기위해 스스로 크기를 조절하고 모두 보이게 할지를 결정하는 프로퍼티
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("본인 인증", style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: Image.asset(
              "assets/images/back_icon.png",
              width: screenWidth * 0.06,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        bottomSheet: SafeArea(
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: RoundedButtonForDialog(
              url: " ",
              borderSize: 0,
              text: "다음",
              color: kMainColor,
              textColor: Colors.white,
              borderColor: Colors.grey.withOpacity(0.3),
              press: () {
                Get.to(() => UserScreen());
              },
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
                child: const Text("원활한 서비스 이용을 위해 본인 인증을 해주세요",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              RoundedButtonForDialog(
                url: " ",
                borderSize: 25,
                text: "인증번호 보내기",
                color: kMainColor,
                textColor: Colors.white,
                borderColor: Colors.grey.withOpacity(0.3),
                press: () {
                  //
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.18),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: "Auth Number",
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text("본인확인 절차이며, 다른 용도로 사용되지 않습니다.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
