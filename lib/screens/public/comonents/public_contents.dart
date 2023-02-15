import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicContents extends StatelessWidget {
  const PublicContents({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Contents(
            title: "클래식",
            image: "assets/images/contents_classic.png",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          Contents(
            title: "재즈",
            image: "assets/images/contents_jazz.png",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          Contents(
            title: "POP",
            image: "assets/images/contents_pop.png",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
        ],
      ),
    );
  }
}

class Contents extends StatelessWidget {
  const Contents({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
        bottom: 5,
      ),
      width: Get.width * 0.36,
      child: GestureDetector(
          onTap: press,
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 5),
                  Container(
                    child: Image.asset(image),
                    width: Get.width * 0.35,
                  ),
                  const SizedBox(height: 5),
                  Text(title,
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center),
                ]),
          )),
    );
  }
}
