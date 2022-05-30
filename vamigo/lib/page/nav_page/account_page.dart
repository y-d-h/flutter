import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/controller/user_info_controller.dart';

class AccountPage extends StatelessWidget {
  var infoController = Get.find<UserInfoController>();

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text(infoController.curNickname.toString()),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account Page Body'),
          ],
        ),
      ),
    );
  }
}
