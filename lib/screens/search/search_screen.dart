import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: searchPageHeader(screenWidth),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "최근 검색어",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text("인기 검색어",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            //향후 회의 후 구현
            Image.asset(
              "assets/images/search.png",
              height: screenWidth * 0.7,
            )
          ],
        )));
  }
}

// 검색창 입력내용 controller
TextEditingController searchTextEditingController = TextEditingController();
// // DB에서 검색된 사용자를 가져오는데 활용되는 변수
// Future<QuerySnapshot> futureSearchResults;

// X 아이콘 클릭시 검색어 삭제
emptyTheTextFormField() {
  searchTextEditingController.clear();
}

// // 검색어 입력후 submit하게되면 DB에서 검색어와 일치하거나 포함하는 결과 가져와서 future변수에 저장
// controlSearching(str) {
//   print(str);
//   Future<QuerySnapshot> allUsers =
//       userReference.where('profileName', isGreaterThanOrEqualTo: str).get();
//   setState(() {
//     futureSearchResults = allUsers;
//   });
// }

// 검색페이지 상단부분
AppBar searchPageHeader(var screenWidth) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          "assets/images/back_icon.png",
          width: screenWidth * 0.06,
        ),
        onPressed: () => Get.back(),
      ),
      title: TextFormField(
        controller: searchTextEditingController, // 검색창 controller
        decoration: const InputDecoration(
            hintText: '방 이름, 내용, 해시태그',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            filled: true,
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 30),
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: emptyTheTextFormField)),
        style: const TextStyle(fontSize: 18, color: Colors.white),
        // onFieldSubmitted: controlSearching,
      ));
}
