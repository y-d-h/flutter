import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/controller/bottom_nav_controller.dart';
import 'package:vamigo/page/nav_page/profile_page/account_page.dart';
import 'package:vamigo/page/nav_page/home_page.dart';
import 'package:vamigo/page/nav_page/search_page.dart';
import 'package:vamigo/page/nav_page/upload_page.dart';

class DashboardPage extends StatefulWidget {
  // StatefulWidget

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());
  List? _pages;

  @override
  void initState() {
    // 생성자 다음에 초기화 호출 부분, 변수 초기화 용도
    // TODO: implement initState
    super.initState();
    _pages = [
      HomePage(),
      SearchPage(),
      UploadPage(),
      AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('DashboardPage >> build');

    return Obx(() => Scaffold(
          body: Center(child: _pages![_bottomNavController.curPage.toInt()]),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              // This is all you need!
              onTap: _bottomNavController.changeCurPage, //_onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline),
                  label: 'upload',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'profile',
                ),
              ],
              currentIndex: _bottomNavController.curPage.toInt()),
        ));
  }
}
