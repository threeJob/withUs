import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:dio/dio.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class LoginScreen extends StatelessWidget {
  get json => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        const Image(
          image: AssetImage("assets/images/login_logo.png"),
        ),
        const SizedBox(height: 90.0),
        // LoginButton(),
        TextButton(
          onPressed: () async {
            late OAuthToken token;

            // if (await isKakaoTalkInstalled()) {
            //   token = await UserApi.instance.loginWithKakaoTalk();
            // } else {
            //   token = await UserApi.instance.loginWithKakaoAccount();
            // }
            if (await isKakaoTalkInstalled()) {
              token = await UserApi.instance.loginWithKakaoTalk();
            } else {
              token = await UserApi.instance.loginWithKakaoAccount();
            }
          },
          child: Container(
              width: 250, child: Image.asset("assets/images/login_kakao.png")),
        ),
      ],
    ));
  }
}
