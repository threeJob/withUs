import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/main.dart';
import 'package:with_us/screens/MyRoom/my_room_list.dart';
import 'package:with_us/screens/Room/finaltest.dart';
import 'package:with_us/screens/Room/room_create.dart';
import 'package:with_us/screens/Room/room_notification.dart';
import 'package:with_us/screens/Room/room_screen.dart';
import 'package:with_us/screens/constants.dart';

class HomeToNextBtn extends StatefulWidget {
  const HomeToNextBtn({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.buttonTitle,
    required this.buttonText,
    required this.buttonId,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String buttonTitle;
  final String buttonText;
  final int buttonId;
  @override
  State<HomeToNextBtn> createState() => _HomeToNextBtnState();
}

class _HomeToNextBtnState extends State<HomeToNextBtn> {
  @override
  Widget build(BuildContext context) {
    String buttonTitle = widget.buttonTitle;
    String buttonText = widget.buttonText;
    int buttonId = widget.buttonId;
    return SizedBox(
      width: widget.screenWidth * 0.43,
      height: widget.screenHeight * 0.14,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.fromLTRB(widget.screenHeight * 0.02,
                widget.screenHeight * 0.025, 0, widget.screenHeight * 0.02),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20) //모서리
                ), //테두리
          ),
          onPressed: () {
            switch (buttonId) {
              case 1:
                print('공식방');
                Get.to(() => RoomNotification());
                break;
              case 2:
                print('스터디룸');
                Get.to(() => AllFieldsForm());
                break;
              case 3:
                print('내 스터디룸');
                Get.to(() => const MyRoomList());
                break;
              case 4:
                print('방만들기');
                Get.to(() => const RoomCreation());
                break;
              default:
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                buttonTitle,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: widget.screenHeight * 0.018,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: KGreyColor),
              )
            ],
          )),
    );
  }
}
