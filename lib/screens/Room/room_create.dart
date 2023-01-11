import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:with_us/screens/Room/room_screen.dart';
import '../constants.dart';
import 'package:super_tag_editor/tag_editor.dart';

enum Content { Public, Private }

class RoomCreation extends StatefulWidget {
  const RoomCreation({super.key});

  @override
  State<RoomCreation> createState() => _RoomCreationState();
}

class _RoomCreationState extends State<RoomCreation> {
  Future pickImage() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  File? _image;
  bool _is_lock = false;
  int limit = 15;
  Content? _content;
  String _name = '';
  final _formKey = GlobalKey<FormState>();
  static const mockResults = [
    'dat@gmail.com',
    'dab246@gmail.com',
    'kaka@gmail.com',
    'datvu@gmail.com'
  ];
  final List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _tc = TextEditingController();

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _is_lock = false;
    limit = 15;
    _content = Content.Public;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DScreenColor,
      appBar: AppBar(
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            : null,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
        ),
        actions: [
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  server.postReq();
                }
                // _callAPI();
                print('submit');
                Get.off(() => RoomScreen());
              },
              child: const Text(
                '완료',
                style: TextStyle(color: TGreyColor, fontSize: 16),
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: pickImage,
                        child: SizedBox(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.3,
                          child: CircleAvatar(
                            backgroundColor: DScreenColor,
                            child: _image == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                        color: TGreyColor,
                                      ),
                                      Text(
                                        '사진 추가',
                                        style: TextStyle(
                                            color: TGreyColor, fontSize: 11),
                                      )
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(300),
                                    child: Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                      width: 148,
                                      height: 148,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onSaved: (newValue) => _name = newValue as String,
                          inputFormatters: [
                            //방 이름 제약사항
                            // FilteringTextInputFormatter(RegExp('[0-9]'), allow: false)
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '방 이름을 입력해 주세요.';
                            }
                            return null;
                          },
                          showCursor: false,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: '방 이름을 입력해 주세요',
                            hintStyle:
                                TextStyle(fontSize: 18, color: TGreyColor),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          '방 이름과 사진은 개설 이후에도 변경이 가능해요',
                          style: TextStyle(fontSize: 12, color: TGreyColor),
                        ),
                      ),
                      Container(
                        color: DScreenColor,
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ListTile(
                          title: Text(
                            '스터디룸 타입 설정',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('공개 스터디룸'),
                        subtitle: const Text(
                          '누구나 스터디룸을 검색해 찾을 수 있고,\n자유롭게 입장이 가능해요.',
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Radio<Content>(
                          activeColor: KGreenColor,
                          groupValue: _content,
                          value: Content.Public,
                          onChanged: (value) => setState(() {
                            _content = value;
                            _is_lock = false;
                          }),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      ListTile(
                        title: const Text('비공개 스터디룸'),
                        subtitle: const Text(
                          '누구나 스터디룸을 검색해 찾을 수 있지만,\n비밀번호를 입력해야 입장이 가능해요.',
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Radio<Content>(
                          activeColor: KGreenColor,
                          groupValue: _content,
                          value: Content.Private,
                          onChanged: (value) => setState(
                            () {
                              _content = value;
                              _is_lock = true;
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        color: DScreenColor,
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListTile(
                              title: const Text(
                                '인원수 설정',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              subtitle: const Text(
                                '최대 15명까지 입장할 수 있습니다.',
                                style: TextStyle(fontSize: 12),
                              ),
                              trailing: ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: screenWidth * 0.3),
                                child: SpinBox(
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: UnderlineInputBorder(),
                                  ),
                                  spacing: 0,
                                  decrementIcon: const Icon(
                                    Icons.remove_circle_outline,
                                  ),
                                  incrementIcon: const Icon(
                                    Icons.add_circle_outline,
                                  ),
                                  iconColor:
                                      MaterialStateProperty.all(KGreenColor),
                                  min: 1,
                                  step: 1,
                                  max: 15,
                                  value: 15,
                                ),
                              ))),
                      Container(
                        height: 10,
                        color: DScreenColor,
                      ),
                      const ListTile(
                        title: Text(
                          '해시태그',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '최대 5개까지 설정할 수 있습니다.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.9,
                        child: TagEditor<String>(
                          minTextFieldWidth: screenWidth * 0.89,
                          cursorColor: Colors.black,
                          length: _values.length,
                          controller: _tc,
                          focusNode: _focusNode,
                          delimiters: const [',', ' '],
                          hasAddButton: false,
                          resetTextOnSubmitted: true,
                          textInputAction: TextInputAction.join,
                          onSubmitted: (outstandingValue) {
                            setState(() {
                              _values.add(outstandingValue);
                            });
                          },
                          inputDecoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(),
                          ),

                          onTagChanged: (newValue) {
                            setState(() {
                              _values.add(newValue);
                            });
                          },
                          tagBuilder: (context, index) => _Chip(
                            index: index,
                            label: _values[index],
                            onDeleted: _onDelete,
                          ),
                          // InputFormatters example, this disallow \ and /
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                          ],

                          suggestionBuilder: (context, state, data) {
                            return ListTile(
                              key: ObjectKey(data),
                              title: Text(data),
                              onTap: () {
                                setState(() {
                                  _values.add(data);
                                });
                                state.selectSuggestion(data);
                              },
                            );
                          },
                          suggestionsBoxElevation: 10,
                          findSuggestions: findSuggestions,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  FutureOr<List<String>> findSuggestions(String query) {
    if (query.isNotEmpty) {
      var lowercaseQuery = query.toLowerCase();
      return mockResults.where((profile) {
        return profile.toLowerCase().contains(query.toLowerCase()) ||
            profile.toLowerCase().contains(query.toLowerCase());
      }).toList(growable: false)
        ..sort((a, b) => a
            .toLowerCase()
            .indexOf(lowercaseQuery)
            .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
    }
    return [];
  }
}

// void _callAPI() async {
//   var url = Uri.parse('http://localhost:8080/api/room');
//   var response = await http.post(url,
//       body: json.encode({
//         {
//           "name": "study With Me",
//           "owner": "yunju",
//           "limit": 4,
//           "content": "Study room",
//           "is_lock": true,
//           "password": "1234",
//           "image": "thumbnail.jpg",
//           "invite_code": '3586',
//           "music": "song.file",
//           "is_valid": true,
//           "hashtags": "studywithme"
//         }
//       }));
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
// }

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: KGreenColor,
      labelStyle: TextStyle(color: Colors.white),
      deleteIconColor: Colors.white,
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}

class Server {
  var url = "/test?id";
  Future<void> getReq() async {
    Response response;
    var dio = Dio();
    response = await dio.get("url");
    print(response.data.toString());
  }

  Future<void> postReq() async {
    Response response;
    var dio = Dio();
    response = await dio.post(url, data: {});
    print(response.data.toString());
  }

  Future<void> getReqWzQuery() async {
    Response response;
    var dio = Dio();
    response = await dio.get(url, queryParameters: {});
    print(response.data.toString());
  }
}

Server server = Server();
