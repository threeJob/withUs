import 'package:flutter/material.dart';
import 'package:with_us/constants.dart';

class RoundedButtonForDialog extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButtonForDialog({
    Key? key,
    required this.text,
    required this.press,
    this.color = kMainColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      height: size.height * 0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
          side: const BorderSide(
            width: 1.0,
            color: kMainColor,
          ),
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
