import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    PreferredSizeWidget _appbarWidget() {
      return AppBar(
        backgroundColor: Color(0xffF2F3F5),
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        elevation: 0, //그림자 주기
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey.withOpacity(0.5),
            ),
            child: Text(
              '완료',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ); //우측 끝 버튼 위치 리;
    }

    return Scaffold(
      backgroundColor: Color(0xffF2F3F5),
      // backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: _appbarWidget(),
      body: Center(
          child: ElevatedButton(
        child: const Text("뒤로가기"),
        onPressed: () {},
      )),
    );
  }
}
