import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  final String imagePath;
  String nickName;
  Size size;
  String person;
  String time;

  SearchWidget({
    Key? key,
    required this.imagePath,
    required this.nickName,
    required this.size,
    required this.person,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: size.width,
            height: size.width,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: Get.width * 0.05,
        ),
        Column(
          children: [
            Text(nickName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 1),
                    Text(person),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    const Icon(Icons.timelapse),
                    const SizedBox(width: 1),
                    Text(time),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
