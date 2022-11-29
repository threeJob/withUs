import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    bool _ischecked = false;
    var selectedRoomType = ['Private', 'Formal'];
    return Scaffold(
      backgroundColor: Color(0xffF2F3F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        elevation: 0, //그림자 주기
        actions: [
          TextButton(
            onPressed: () {
              print("완료 is clicked");
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey.withOpacity(0.5),
            ),
            child: Text(
              '완료',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingActionButton.large(
                        backgroundColor: Color(0xffF2F3F5),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                        elevation: 0,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          onChanged: ((value) {}),
                          onSubmitted: ((value) {}),
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: "방 이름을 입력해주세요"),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "방 이름과 사진은 개설 이후에도 변경 가능합니다.",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "스터디룸 타입 설정",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedRoomType,
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                  },
                  title: const Text('공개 스터디룸', style: TextStyle(fontSize: 18)),
                  subtitle: const Text(
                    '누구나 스터디룸을 검색해 찾을 수 있고 자유롭게 입장이 가능해요',
                    style: TextStyle(fontSize: 13),
                  ),
                  activeColor: Colors.black,
                  isThreeLine: false,
                  selected: true,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedRoomType,
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                  },
                  title: const Text('비공개 스터디룸', style: TextStyle(fontSize: 18)),
                  subtitle: const Text(
                    '누구나 스터디룸을 검색해 찾을 수 있지만,비밀번호를 입력해야 입장이 가능해요.',
                    style: TextStyle(fontSize: 13),
                  ),
                  activeColor: Colors.black,
                  isThreeLine: false,
                  selected: true,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding: EdgeInsets.all(16),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '인원수 설정',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text('최대 50명까지 입장하실 수 있습니다.'),
              onTap: (() {
                print('Setting is clicked');
              }),
              trailing: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
