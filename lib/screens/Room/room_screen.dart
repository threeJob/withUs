import 'package:el_tooltip2/el_tooltip2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/screens/Home/home_screen.dart';
import 'package:with_us/screens/Room/room_notification.dart';
import 'package:with_us/screens/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'dart:math' as math;
import 'room_settings.dart';
import 'package:expandable/expandable.dart';

class RoomScreen extends StatefulWidget {
  RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final PageController _pageController = PageController();

  bool micActivation = false;
  bool vidActivation = false;
  bool timerActivation = false;
  final _isHours = true;
  String tooltipContent =
      '앱을 개발한다면 앱의 확장성과 유지보수의 편의성을 고려해서 꼭 아키텍처를 적용하는 것이 필요하다.개인적으로 모바일 앱에 가장 적합한 아키텍처는 MVVM이라고 생각한다.Flutter로 앱을 개발할때 Andorid 앱 개발에 사용하던 MVVM 아키텍처를 어떻게 하면 Flutter 특성에 맞게 잘 적용 시킬 수 있을지 많은 고민을 했었다.';
  // final ElTooltipState eltooltip = ElTooltipState();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onStopped: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  @override
  void initState() {
    super.initState();
    micActivation = false;
    vidActivation = false;
    timerActivation = false;
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = Get.width;
    var screenHeight = Get.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Get.isPopGestureEnable ? Get.back() : null;
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          '방 제목',
          style: TextStyle(color: Colors.black),
        ),
      ),
      endDrawer: Drawer(
          backgroundColor: Colors.white,
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      ListTile(
                        leading: const Text(
                          '공지사항',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(() => RoomNotification());
                        },
                      ),
                      ListTile(
                        leading: const Text(
                          '휴게실 입장',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                        onTap: () {
                          print('내 정보 tapped');
                        },
                      ),
                      ListTile(
                        leading: const Text(
                          '초대하기',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                        onTap: () {
                          print('내 정보 tapped');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          print('나가기 clicked');
                          Get.offAll(HomeScreen());
                        },
                        icon: Icon(Icons.logout_outlined)),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                          onPressed: () => Get.to(RoomSettings()),
                          icon: Icon(Icons.settings)),
                    )
                  ],
                )
              ],
            ),
          )),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: DScreenColor),
                child: FittedBox(
                    alignment: Alignment.center,
                    child: Row(children: [
                      Icon(
                        Icons.person,
                        size: 18,
                      ),
                      Text('2/30'),
                    ])),
              ),
              ElTooltip(
                  showModal: false,
                  position: ElTooltipPosition.leftStart,
                  content: Wrap(children: [
                    ExpandablePanel(
                      theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                          tapBodyToExpand: true,
                          iconPlacement: ExpandablePanelIconPlacement.right,
                          iconColor: Colors.white),
                      header: Text(
                        "[공지사항 제목]",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      collapsed: Text(
                        tooltipContent,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                      expanded: Text(
                        tooltipContent,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                  color: KGreenColor,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: DScreenColor,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: const Icon(
                          Icons.campaign,
                          size: 20,
                          color: KGreenColor,
                        )),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.65,
          child: PageView(controller: _pageController, children: const [
            VideoView(),
            VideoView(),
            VideoView(),
          ]),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const SlideEffect(
              dotWidth: 7,
              dotHeight: 7,
              dotColor: TGreyColor,
              activeDotColor: KGreenColor),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenHeight * 0.06,
                width: screenWidth * 0.25,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BtnGreyColor, elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30) //모서리
                          ), //
                    ),
                    onPressed: () {
                      setState(() {
                        vidActivation = !vidActivation;
                      });
                      print(vidActivation);
                    },
                    child: Icon(
                      CupertinoIcons.video_camera_solid,
                      color: vidActivation ? KGreenColor : TGreyColor,
                      size: 40,
                    )),
              ),
              Container(
                width: screenWidth * 0.6,
                height: screenHeight * 0.06,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: BtnGreyColor),
                child: StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data!;
                    final displayTime = StopWatchTimer.getDisplayTime(value,
                        hours: _isHours, milliSecond: false);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          displayTime,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          color: KGreenColor,
                          iconSize: 35,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              timerActivation = !timerActivation;
                            });
                            if (timerActivation) {
                              _stopWatchTimer.onStartTimer();
                            } else {
                              _stopWatchTimer.onStopTimer();
                            }
                            print(timerActivation);
                          },
                          icon: timerActivation
                              ? const Icon(
                                  Icons.pause_circle_outline,
                                )
                              : const Icon(Icons.play_circle_outline),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // IconButton(
              //     onPressed: () => print('mic clicked'),
              //     icon: Icon(
              //       CupertinoIcons.mic_fill,
              //       size: 35,
              //     )),
            ],
          ),
        )
      ]),
    );
  }
}

class VideoView extends StatelessWidget {
  const VideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1,
        children: const [
          VideoBlock(),
          VideoBlock(),
          VideoBlock(),
          VideoBlock(),
          VideoBlock(),
          VideoBlock(),
        ],
      ),
    );
  }
}

class VideoBlock extends StatelessWidget {
  const VideoBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: DScreenColor,
      ),
      // padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print('pressed');
            },
          )
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.child,
    this.color,
    this.disableColor,
    this.elevation,
    this.side = BorderSide.none,
    this.onTap,
    super.key,
  });

  final Widget child;
  final Color? color;
  final Color? disableColor;
  final double? elevation;
  final BorderSide side;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        shape: const StadiumBorder().copyWith(side: side),
        disabledBackgroundColor: disableColor ?? Colors.grey,
        elevation: elevation,
      ),
      onPressed: onTap,
      child: child,
    );
  }
}

// class RoomNotification extends StatelessWidget {
//   const RoomNotification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Padding(padding: EdgeInsets.all(100)),
//           Text(
//             'Notification',
//             style: TextStyle(color: Colors.black, fontSize: 50),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute<SecondRoute>(
                      builder: (context) => SecondRoute(),
                    ),
                  );
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
