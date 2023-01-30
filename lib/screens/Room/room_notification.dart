import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:with_us/screens/Room/Finaltest.dart';

class RoomNotification extends StatefulWidget {
  const RoomNotification({super.key});

  @override
  State<RoomNotification> createState() => _RoomNotificationState();
}

class _RoomNotificationState extends State<RoomNotification> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFieldsFormBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: ModalRoute.of(context)?.canPop == true
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      Get.back();
                    },
                  )
                : null,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              '공지사항',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => AllFieldsForm(),
                        transition: Transition.downToUp,
                        fullscreenDialog: true);
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                  ))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('공지사항 제목1'),
                          Text('2022/01/27', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      subtitle:
                          const Text('공지사항 내용 주절주절 룰루룰룰 주룾루주루어라어나머ㅑ러댜ㅐ러ㅑ매'),
                    ),
                    const ListTile(
                      title: Text('공지사항 제목2'),
                      subtitle: Text('공지사항 내용 주절주절 룰루룰룰 주룾루주루어라어나머ㅑ러댜ㅐ러ㅑ매'),
                    ),
                    const ListTile(
                      title: Text('공지사항 제목3'),
                      subtitle: Text('공지사항 내용 주절주절 룰루룰룰 주룾루주루어라어나머ㅑ러댜ㅐ러ㅑ매'),
                    ),
                    const ListTile(
                      title: Text('공지사항 제목4'),
                      subtitle: Text('공지사항 내용 주절주절 룰루룰룰 주룾루주루어라어나머ㅑ러댜ㅐ러ㅑ매'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
