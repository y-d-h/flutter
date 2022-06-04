import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/components/bottom_sheet.dart';
import 'package:vamigo/components/circle_avatar.dart';
import 'package:vamigo/components/styles.dart';
import 'package:vamigo/controller/tapbar_controller.dart';
import 'package:vamigo/controller/user_info_controller.dart';
import 'package:vamigo/page/nav_page/profile_page/first_page.dart';
import 'package:vamigo/page/nav_page/profile_page/profile_edit_page.dart';
import 'package:vamigo/page/nav_page/profile_page/second_page.dart';

class AccountPage extends StatelessWidget {
  var infoController = Get.find<UserInfoController>();

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    final controller = Get.put(TabBarController());
    return Scaffold(
      appBar: AppBar(
        //title: Text(infoController.curNickname.toString()),
        title: Text('nickname'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: '프로필 편집',
            onPressed: () {
              Get.to(ProfileEditPage());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imageProfile(),
            TextButton(
              onPressed: () {
                profileBottomSheet();
              },
              child: Text('프로필 사진 변경'),
            ),
            Text('자기소개'),
            SizedBox(height: 10),
            // OutlinedButton(
            //   onPressed: () {},
            //   child: Text('프로필 편집'),
            //   style: TextButton.styleFrom(
            //     primary: Colors.black,
            //     side: BorderSide(color: Colors.black, width: 1),
            //     shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(30))),
            //     textStyle: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //     ),
            //     fixedSize: Size(300, 40),
            //   ),
            // ),
            TabBar(
              controller: controller.tabController,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.first_page,
                  color: Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.last_page,
                  color: Colors.black,
                )),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  FirstPage(),
                  SecondPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
