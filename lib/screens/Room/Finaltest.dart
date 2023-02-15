import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart' hide Response;
import 'package:with_us/screens/constants.dart';

class AllFieldsFormBloc extends FormBloc<String, String> {
  final title = TextFieldBloc(validators: [
    FieldBlocValidators.required,
  ]);
  final content = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  AllFieldsFormBloc() : super(autoValidate: false) {
    addFieldBlocs(fieldBlocs: [title, content]);
  }

  void addErrors() {
    title.addFieldError('Awesome Error!');
  }

  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}

class AllFieldsForm extends StatefulWidget {
  const AllFieldsForm({Key? key}) : super(key: key);

  @override
  State<AllFieldsForm> createState() => _AllFieldsFormState();
}

class _AllFieldsFormState extends State<AllFieldsForm> {
  String notice = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFieldsFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<AllFieldsFormBloc>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                '글쓰기',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              leading: ModalRoute.of(context)?.canPop == true
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        // size: 20,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  : null,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              // title: Padding(
              //   padding: EdgeInsets.only(left: screenWidth * 0.02),
              // ),
              actions: [
                TextButton(
                    onPressed: () {
                      print('submit notice');
                      server.postReq(notice);
                    },
                    child: const Text(
                      '완료',
                      style: TextStyle(color: TGreyColor, fontSize: 16),
                    ))
              ],
            ),
            body: FormBlocListener<AllFieldsFormBloc, String, String>(
              // onSubmitting: (context, state) {
              //   LoadingDialog.show(context);
              // },
              // onSuccess: (context, state) {
              //   LoadingDialog.hide(context);

              //   Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(builder: (_) => const SuccessScreen()));
              // },
              // onFailure: (context, state) {
              //   LoadingDialog.hide(context);
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(content: Text(state.failureResponse!)));
              // },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TextFieldBlocBuilder(
                        onChanged: (value) => setState(() {
                              notice = value;
                              print(notice);
                            }),
                        expands: true,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textFieldBloc: formBloc.content,
                        autofillHints: const [
                          AutofillHints.username,
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          alignLabelWithHint: true,

                          floatingLabelStyle: TextStyle(color: KGreenColor),
                          // hintText: '공지할 내용을 입력해 주세요.',
                          hintStyle: TextStyle(color: TGreyColor),
                          // labelText: '공지할 내용을 입력해 주세요.',
                          // labelStyle: TextStyle(color: TGreyColor),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.zero),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class LoadingDialog extends StatelessWidget {
//   static void show(BuildContext context, {Key? key}) => showDialog<void>(
//         context: context,
//         useRootNavigator: false,
//         barrierDismissible: false,
//         builder: (_) => LoadingDialog(key: key),
//       ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

//   static void hide(BuildContext context) => Navigator.pop(context);

//   const LoadingDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Center(
//         child: Card(
//           child: Container(
//             width: 80,
//             height: 80,
//             padding: const EdgeInsets.all(12.0),
//             child: const CircularProgressIndicator(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SuccessScreen extends StatelessWidget {
//   const SuccessScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Icon(Icons.tag_faces, size: 100),
//             const SizedBox(height: 10),
//             const Text(
//               'Success',
//               style: TextStyle(fontSize: 54, color: Colors.black),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () => Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (_) => const AllFieldsForm())),
//               icon: const Icon(Icons.replay),
//               label: const Text('AGAIN'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Server {
  var url = "http://43.201.24.189/api/room/notice/2";
  Future<void> getReq() async {
    Response response;
    var dio = Dio();
    response = await dio.get(url);
    print(response.data.toString());
  }

  Future<void> postReq(notice) async {
    var dio = Dio();
    try {
      Response response = await dio.post(url, data: {"notice": notice});
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
