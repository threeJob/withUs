import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:dio/dio.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/screens/auth/auth_screen.dart';
import 'package:with_us/widgets/rounded_button.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class HomeScreen extends StatelessWidget {
  get json => null;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
