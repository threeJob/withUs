import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart' hide Transition;
import 'package:get/get.dart' hide Response;
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
            foregroundColor: Colors.black,
            title: const Text(
              '공지사항',
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Text(
                  '앱을 개발한다면 앱의 확장성과 유지보수의 편의성을 고려해서 꼭 아키텍처를 적용하는 것이 필요하다.개인적으로 모바일 앱에 가장 적합한 아키텍처는 MVVM이라고 생각한다.Flutter로 앱을 개발할때 Andorid 앱 개발에 사용하던 MVVM 아키텍처를 어떻게 하면 Flutter 특성에 맞게 잘 적용 시킬 수 있을지 많은 고민을 했었다.',
                  style: TextStyle(fontSize: 16),
                ),
                // TextButton(onPressed: server.getReq(), child: child)
              ],
            ),
          ),
        );
      }),
    );
  }
}

class Server {
  var url = "http://43.201.24.189//api/room/notice/2";
  Future<void> getReq() async {
    Response response;
    var dio = Dio();
    response = await dio.get(url);
    print(response.data.toString());
  }

  Future<void> postReq(name, is_lock, thumbnail, limit, hashtags) async {
    var dio = Dio();
    try {
      Response response = await dio.post(url, data: {});
    } catch (e) {
      print(e);
    } finally {
      dio.close();
    }
    // print(response.data.toString());
  }

  Future<void> getReqWzQuery() async {
    Response response;
    var dio = Dio();
    response = await dio.get(url, queryParameters: {});
    print(response.data.toString());
  }
}

Server server = Server();
