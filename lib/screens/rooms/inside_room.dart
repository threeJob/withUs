import 'package:flutter/material.dart';

class InsideRoom extends StatefulWidget {
  const InsideRoom({super.key});

  @override
  State<InsideRoom> createState() => _InsideRoomState();
}

class _InsideRoomState extends State<InsideRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //무언가를 혼자해낼 수 있도록 발판을 만들어주는 것(빈 도화지 같은 역할)
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, //색변경
        ),
        elevation: 0, //그림자 주기
        title: Text("방 제목"),
      ),
      endDrawer: Drawer(backgroundColor: Color.fromRGBO(0, 0, 0, 0.25)),
      body: Center(
          //자식 위젯을 가짐
          child: Column(
        //column이 자식을 가진다면 children(복수)
        children: [Text("testing")],
      )),
    );
  }
}
