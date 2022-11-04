import 'package:flutter/material.dart';
import 'package:with_us/constants.dart';

class RoundedButtonForDialog extends StatelessWidget {
  final String text;
  final String url;
  final VoidCallback press;
  final Color color, textColor, borderColor;
  final double borderSize;
  const RoundedButtonForDialog({
    Key? key,
    required this.text,
    required this.url,
    required this.press,
    this.color = kMainColor,
    this.textColor = Colors.white,
    this.borderColor = kMainColor,
    this.borderSize = 29,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      height: size.height * 0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderSize),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderSize)),
          side: BorderSide(
            width: 1.0,
            color: borderColor,
          ),
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
      child: url == ' '
          ? Text(
              text,
              style: TextStyle(color: textColor),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    url,
                    height: 30,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
    );
  }
}
