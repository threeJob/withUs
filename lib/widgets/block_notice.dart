import 'package:flutter/material.dart';
import 'package:with_us/screens/constants.dart';

class NoticeBlock extends StatelessWidget {
  const NoticeBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: BGreyColor),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 0,
          indent: 10,
          endIndent: 10,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            child: ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: const Text(
                '공지사항 1',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                print('Home is clicked');
              },
              trailing: const Text(
                '2022.11.23',
                style: TextStyle(fontSize: 11, color: KGreyColor),
              ),
            ),
          );
        },
        padding: EdgeInsets.zero,
      ),
    );
  }
}
