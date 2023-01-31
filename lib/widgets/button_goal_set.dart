import 'package:flutter/material.dart';

import '../screens/constants.dart';

class GoalSetButton extends StatelessWidget {
  const GoalSetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          print('object pressed');
        },
        child: const Text('목표 설정하기 >',
            style: TextStyle(
                color: TGreyColor, fontSize: 8, fontWeight: FontWeight.w400)));
  }
}
