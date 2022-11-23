import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/custom_scaffold.dart';
import 'package:with_us/screens/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      backgroundColor: DScreenColor,
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.06,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: DScreenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            "assets/images/logo.png",
            width: screenWidth * 0.25,
          ),
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
            constraints: BoxConstraints(),
            padding: EdgeInsets.only(right: 16),
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: () {
              print('Notification is clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(children: [
            SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.18,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20) //모서리
                      ), //테두리
                  // maximumSize: screenWidth * 0.85,
                  // minimumSize: screenWidth * 0.85
                ),
                onPressed: () {
                  print('Button 1 pressed');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '화이트하임님 🍎',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '오늘 공부시간',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(
                        //   width: screenWidth * 0.37,
                        // ),
                        SizedBox(
                          height: screenHeight * 0.04,
                          child: TextButton(
                              onPressed: () {
                                print('object pressed');
                              },
                              child: Text('목표 설정하기 >',
                                  style: TextStyle(
                                      color: TGreyColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400))),
                        ),
                      ],
                    ),
                    Text(
                      '45분 / 60분',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20) //모서리
                              ), //테두리
                          // maximumSize: screenWidth * 0.85,
                          // minimumSize: screenWidth * 0.85
                        ),
                        onPressed: () {
                          print('this is second button');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '공식방 선택하기',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Text(
                              '원하는 컨셉\n선택하기',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: KGreyColor),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20) //모서리
                              ), //테두리
                          // maximumSize: screenWidth * 0.85,
                          // minimumSize: screenWidth * 0.85
                        ),
                        onPressed: () {
                          print('this is second button');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '스터디룸 입장하기',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Text(
                              '공식방\n랜덤 입장하기',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: KGreyColor),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20) //모서리
                              ), //테두리
                          // maximumSize: screenWidth * 0.85,
                          // minimumSize: screenWidth * 0.85
                        ),
                        onPressed: () {
                          print('this is second button');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '내 스터디룸',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Text(
                              '내 스터디룸 관리하기',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: KGreyColor),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20) //모서리
                              ), //테두리
                          // maximumSize: screenWidth * 0.85,
                          // minimumSize: screenWidth * 0.85
                        ),
                        onPressed: () {
                          print('this is second button');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '방 만들기',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Text(
                              '나만의\n방 만들기',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: KGreyColor),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  '공지사항',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: BGreyColor),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: screenHeight * 0.043,
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.grey[850],
                      ),
                      title: Text('공지사항 1'),
                      onTap: () {
                        print('Home is clicked');
                      },
                      trailing: Icon(Icons.add),
                    ),
                  );
                },
                padding: EdgeInsets.zero,
                // children: [
                //   ListTile(
                //     leading: Icon(
                //       Icons.home,
                //       color: Colors.grey[850],
                //     ),
                //     title: Text('공지사항 1'),
                //     onTap: () {
                //       print('Home is clicked');
                //     },
                //     trailing: Icon(Icons.add),
                //   ),
                //   ListTile(
                //     leading: Icon(
                //       Icons.settings,
                //       color: Colors.grey[850],
                //     ),
                //     title: Text('공지사항 2'),
                //     onTap: () {
                //       print('Setting is clicked');
                //     },
                //     trailing: Icon(Icons.add),
                //   ),
                //   ListTile(
                //     leading: Icon(
                //       Icons.question_answer,
                //       color: Colors.grey[850],
                //     ),
                //     title: Text('공지사항 3'),
                //     onTap: () {
                //       print('Q&A is clicked');
                //     },
                //     trailing: Icon(Icons.add),
                //   ),
                // ],
              ),
            ),
          ]),
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
