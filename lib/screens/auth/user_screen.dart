import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:dio/dio.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/screens/auth/welcome_screen.dart';
import 'package:with_us/widgets/rounded_button.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  get json => null;

  final nameController = TextEditingController(); // 이름 입력을 위한 controller
  final nickNameController = TextEditingController(); // 닉네임 입력을 위한 controller

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
          title: const Text("닉네임 설정", style: TextStyle(color: Colors.black)),
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
                Get.to(() => WelcomeScreen());
              },
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: const Text("프로필 사진",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/user_image_default.png",
                      width: 130,
                      height: 130,
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("이름"),
                    const SizedBox(height: 5),
                    TextField(
                      style: TextStyle(fontSize: 13),
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        isDense: true,
                        fillColor: Colors.white,
                        hintText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: kMainColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("닉네임"),
                    const SizedBox(height: 5),
                    TextField(
                      style: TextStyle(fontSize: 13),
                      controller: nickNameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        isDense: true,
                        fillColor: Colors.white,
                        hintText: "NickName",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: kMainColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
