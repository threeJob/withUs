import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comonents/public_contents.dart';

class PublicScreen extends StatelessWidget {
  const PublicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("공식방 선택하기", style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: Image.asset(
              "assets/images/back_icon.png",
              width: screenWidth * 0.06,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: Get.height * 0.01,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('카페석(with 장르)',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const PublicContents(),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('노트북석',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const PublicContents(),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('ASMR',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  textAlign: TextAlign.left),
            ),
            const PublicContents(),
            SizedBox(
              height: screenHeight * 0.05,
            ),
          ],
        )));
  }
}
