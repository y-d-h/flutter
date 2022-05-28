import 'package:flutter/material.dart';
import 'package:vamigo/components/dialog.dart';
import 'package:vamigo/components/snackbar.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('test page'),
          OutlinedButton(
              onPressed: () {
                //TestGetxDialog();
                getxSnackbar('', '메일이 도착하기까지 시간이 걸릴 수 있습니다');
              },
              child: Text('test getx dialog')),
        ],
      )),
    );
  }
}
