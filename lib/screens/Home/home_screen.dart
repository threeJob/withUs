import 'package:flutter/material.dart';
import 'package:with_us/custom_scaffold.dart';
import 'package:with_us/screens/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:with_us/widgets/block_main_state.dart';
import 'package:with_us/widgets/block_notice.dart';
import 'package:with_us/widgets/button_home_to_next.dart';

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
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: DScreenColor,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: Image.asset(
            "assets/images/logo.png",
            width: screenWidth * 0.25,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.only(right: screenWidth * 0.016),
            icon: const Icon(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 0.9,
                  child: MainStateBlock(screenHeight: screenHeight),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 0.7,
                  child: HomeToNextBtn(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '공식방 선택하기',
                    buttonText: '원하는 컨셉\n선택하기',
                    buttonId: 1,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 0.7,
                  child: HomeToNextBtn(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '스터디룸 입장하기',
                    buttonText: '공식방\n랜덤 입장하기',
                    buttonId: 2,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 0.7,
                  child: HomeToNextBtn(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '내 스터디룸',
                    buttonText: '\n내 스터디룸 관리하기',
                    buttonId: 3,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 0.7,
                  child: HomeToNextBtn(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    buttonTitle: '방 만들기',
                    buttonText: '나만의\n방 만들기',
                    buttonId: 4,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(1)),
                const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 0.2,
                  child: Text(
                    '공지사항',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 0.8,
                  child: NoticeBlock(),
                )
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          elevation: 0,
          items: const [
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '화이트하임',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings_outlined))
                    ],
                  ),
                ),
              ),
              DrawerTile(),
              DrawerTile(),
              DrawerTile(),
            ],
          )),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text(
        '내 정보',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      onTap: () {
        print('내 정보 tapped');
      },
    );
  }
}
