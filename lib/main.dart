import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_us/constants.dart';
import 'package:with_us/screens/auth/auth_screen.dart';
import 'package:with_us/screens/auth/user_screen.dart';
import 'package:with_us/screens/auth/welcome_screen.dart';
import 'package:with_us/screens/first/first_screen.dart';
import 'package:with_us/screens/home/home_screen.dart';
import 'package:with_us/screens/login/login_screen.dart';
import 'package:with_us/screens/search/search_screen.dart';
import 'package:with_us/screens/splash/splash_screen.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  // To load the .env file contents into dotenv.

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '65b859dd30deee5958972d141cdc0982',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 2000)),
      // Show splash screen while waiting for app resources to load:
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: SplashScreen());
        } else {
          return GetMaterialApp(
            title: 'withUs',
            // initialRoute: '/firstScreen',
            initialRoute: '/searchScreen',
            getPages: [
              GetPage(name: '/loginScreen', page: () => LoginScreen()),
              GetPage(name: '/firstScreen', page: () => const FirstScreen()),
              GetPage(name: '/welcomeScreen', page: () => WelcomeScreen()),
              GetPage(name: '/authScreen', page: () => AuthScreen()),
              GetPage(name: '/userScreen', page: () => UserScreen()),
              GetPage(name: '/homeScreen', page: () => HomeScreen()),
              GetPage(name: '/searchScreen', page: () => const SearchScreen())
            ],
            theme: ThemeData(
              primarySwatch: _createMaterialColor(kMainColor),
              // fontFamily: "GmarketSans"
            ),
            home: const FirstScreen(),
          );
        }
      },
    );
  }
}

MaterialColor _createMaterialColor(Color color) {
  List<double> strengths = [.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
