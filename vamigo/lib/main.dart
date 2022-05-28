import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/binding/init_binding.dart';
import 'package:vamigo/components/themes.dart';
import 'package:vamigo/page/dashboard_page.dart';
import 'package:vamigo/vamigo.dart';
import 'package:vamigo/page/auth_page/sign_in_page.dart';
import 'package:vamigo/page/auth_page/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamigo',
      theme: ThemeData(
        // 전체 테마
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          // 앱바 테마
          color: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          // 버튼 테마
          style: TextButton.styleFrom(
            primary: Colors.black,
            side: BorderSide(color: Colors.black, width: 1),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            fixedSize: Size(300, 40),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          // 텍스트 필드 테마
          cursorColor: Colors.black,
          selectionColor: Colors.blue.shade200,
        ),
      ),
      home: Vamigo(),
      initialBinding: InitBinding(), // 바인딩
      initialRoute: '/',
      getPages: [
        // 네임드 페이지
        GetPage(
            name: '/',
            page: () => const Vamigo(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/signup',
            page: () => const SignUpPage(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/signin',
            page: () => const SignInPage(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/dashboard',
            page: () => DashboardPage(),
            transition: Transition.leftToRight),
        // GetPage(
        //     name: '/app',
        //     page: () => const App(),
        //     transition: Transition.leftToRight),
        // GetPage(
        //     name: '/search',
        //     page: () => const SearchPage(),
        //     transition: Transition.leftToRight),
        // GetPage(
        //     name: '/profile',
        //     page: () => const ProfilePage(),
        //     transition: Transition.leftToRight),
        // GetPage(
        //     name: '/upload',
        //     page: () => const UploadPage(),
        //     transition: Transition.leftToRight),
      ],
    );
  }
}
