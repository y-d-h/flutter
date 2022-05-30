import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/controller/user_info_controller.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Upload Page Body'),
          ],
        ),
      ),
    );
  }
}
