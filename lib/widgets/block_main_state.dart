import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:with_us/screens/constants.dart';

import 'button_goal_set.dart';

class MainStateBlock extends StatelessWidget {
  const MainStateBlock({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(screenHeight * 0.02),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenHeight * 0.02) //모서리
            ), //테두리
      ),
      onPressed: () {
        print('MainStateBlock pressed');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '화이트하임님 🍎',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '오늘 공부시간',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.04,
                child: const GoalSetButton(),
              ),
            ],
          ),
          const Text(
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
            ranges: const [
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
          const Text(
            '이번주 최고기록 2:19:00',
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
