import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/screens/constants.dart';

class MyRoomList extends StatelessWidget {
  const MyRoomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            : null,
        title: const Text(
          '내 스터디룸',
        ),
        actions: [
          IconButton(onPressed: () => print('search'), icon: Icon(Icons.search))
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              RoomTile(
                color: BRedColor,
                title: '[대학] 경대생 들어오세요',
                people: '123/200',
                time: '12:11:10',
                imagetitle: 'KNU',
              ),
              SizedBox(
                height: 20,
              ),
              RoomTile(
                color: Color(0xFF9CCAFF),
                title: '어쩌구저쩌구 이러쿵저러쿵',
                people: '124/200',
                time: '12:11:10',
                imagetitle: 'CAFE',
              ),
              SizedBox(
                height: 20,
              ),
              RoomTile(
                color: Color(0xFFBC67FF),
                title: '[ASMR] 카페 asmr 들으러 오세요',
                people: '123/100',
                time: '12:01:10',
                imagetitle: 'ASMR',
              ),
              SizedBox(
                height: 20,
              ),
              RoomTile(
                color: Color(0xFFFFF278),
                title: '카카오',
                people: '123/200',
                time: '12:11:10',
                imagetitle: 'kakao',
              ),
              SizedBox(
                height: 20,
              ),
              RoomTile(
                color: Color(0xFF0047FF),
                title: '[기업면접] toss',
                people: '123/200',
                time: '12:11:10',
                imagetitle: 'toss',
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class RoomTile extends StatefulWidget {
  const RoomTile({
    Key? key,
    required this.color,
    required this.title,
    required this.people,
    required this.time,
    required this.imagetitle,
  }) : super(key: key);
  final Color color;
  final String title;
  final String people;
  final String time;
  final String imagetitle;
  @override
  State<RoomTile> createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.color;
    String title = widget.title;
    String people = widget.people;
    String time = widget.time;
    String imagetitle = widget.imagetitle;
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: color,
          child: Text(
            imagetitle,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Wrap(children: [
              const Icon(
                Icons.person,
                size: 16,
              ),
              Text(
                people,
                style: const TextStyle(fontSize: 14),
              )
            ]),
            Wrap(children: [
              const Icon(
                Icons.timer_rounded,
                size: 16,
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 14),
              )
            ]),
          ],
        )
      ],
    );
  }
}
