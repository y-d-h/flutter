import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/components/iamge_data.dart';
import 'package:vamigo/test.dart';

class Vamigo extends StatelessWidget {
  const Vamigo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // vamigo 로고
              margin: EdgeInsets.only(bottom: 70),
              width: 250,
              height: 100,
              child: ImageData(
                IconsPath.logo,
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  Get.toNamed('/signin');
                },
                child: Text('로그인')),
            SizedBox(height: 10),
            OutlinedButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: Text('회원가입')),
            OutlinedButton(
                onPressed: () {
                  Get.to(Test());
                },
                child: Text('test')),
          ],
        ),
      ),
    );
  }
}
