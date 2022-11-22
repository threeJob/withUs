import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color.fromRGBO(242, 243, 245, 1),
        title: Image.asset(
          "assets/images/logo.png",
          width: screenWidth * 0.25,
        ),
        // IconButton(
        //   constraints: BoxConstraints(),
        //   icon: Image.asset(
        //     "assets/images/logo.png",
        //     width: screenWidth,
        //     height: screenHeight,
        //   ),
        //   onPressed: () => print('Logo clicked')
        //   // => Get.to(() => HomeScreen())
        //   ,
        // ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: () {
              print('Notification is clicked');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, elevation: 0),
            onPressed: () {
              print('Button 1 pressed');
            },
            child: Column(
              children: [
                Text(
                  '화이트하임님 🍎',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '오늘 공부시간',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '45분/60분',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ]),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: () {
                  print('Drawer clicked');
                },
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
