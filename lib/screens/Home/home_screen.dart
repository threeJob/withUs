import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/custom_scaffold.dart';
import 'package:with_us/screens/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      backgroundColor: DScreenColor,
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.08,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: DScreenColor,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
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
            padding: EdgeInsets.only(right: screenWidth * 0.016),
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
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(screenHeight * 0.02) //모서리
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
                    SizedBox(
                      height: screenHeight * 0.007,
                    ),
                    SfLinearGauge(
                      minimum: 0,
                      maximum: 100,
                      axisTrackStyle: LinearAxisTrackStyle(
                          color: DScreenColor,
                          thickness: screenHeight * 0.007,
                          edgeStyle: LinearEdgeStyle.bothCurve),
                      showLabels: false,
                      showTicks: false,
                      ranges: [
                        LinearGaugeRange(
                          position: LinearElementPosition.cross,
                          startValue: 0,
                          //endValue 조정 통해서 현재 공부한 시간만큼 게이지 조정.
                          endValue: 75,
                          color: KGreenColor,
                          edgeStyle: LinearEdgeStyle.bothCurve,
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.007,
                    ),
                    Text(
                      '이번주 최고기록 2:19:00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
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
                  home_to_next_button(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '공식방 선택하기',
                    buttonText: '원하는 컨셉\n선택하기',
                    buttonId: 1,
                  ),
                  home_to_next_button(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '스터디룸 입장하기',
                    buttonText: '공식방\n랜덤 입장하기',
                    buttonId: 2,
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
                  home_to_next_button(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '내 스터디룸',
                    buttonText: '\n내 스터디룸 관리하기',
                    buttonId: 3,
                  ),
                  home_to_next_button(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '방 만들기',
                    buttonText: '나만의\n방 만들기',
                    buttonId: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
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
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: BGreyColor),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      title: Text(
                        '공지사항 1',
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        print('Home is clicked');
                      },
                      trailing: Text(
                        '2022.11.23',
                        style: TextStyle(fontSize: 11, color: KGreyColor),
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.zero,
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontSize: 12),
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: '달력')
          ]),
      endDrawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 150,
                child: DrawerHeader(
                  child: Row(
                    children: [
                      Text(
                        '화이트하임',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.settings_outlined))
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  '내 정보',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onTap: () {
                  print('내 정보 tapped');
                },
              ),
              ListTile(
                leading: Text(
                  '내 정보',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onTap: () {
                  print('내 정보 tapped');
                },
              ),
              ListTile(
                leading: Text(
                  '내 정보',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onTap: () {
                  print('내 정보 tapped');
                },
              )
            ],
          )),
    );
  }
}

class home_to_next_button extends StatefulWidget {
  const home_to_next_button({
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
  State<home_to_next_button> createState() => _home_to_next_buttonState();
}

class _home_to_next_buttonState extends State<home_to_next_button> {
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
                break;
              case 2:
                print('스터디룸');
                break;
              case 3:
                print('내 스터디룸');
                break;
              case 4:
                print('방만들기');
                break;
              default:
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                buttonTitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: widget.screenHeight * 0.018,
              ),
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: KGreyColor),
              )
            ],
          )),
    );
  }
}
