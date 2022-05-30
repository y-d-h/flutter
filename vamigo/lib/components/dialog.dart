import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';

class Dialog {
  static Future signinDialog(BuildContext context, dynamic value) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    value.body,
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('확인'),
              ),
            ],
          );
        });
  }
}

Future SignInDialog(dynamic value) async {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text('로그인 실패'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              value.body,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('확인'),
          onPressed: () => Get.back(),
        )
      ],
    ),
  );
}

void ResponseDialog(Response response) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text(response.statusCode.toString()),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(response.body),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('확인'),
          onPressed: () => Get.back(),
        )
      ],
    ),
  );
}

void signupDialog() {
  Get.dialog(AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    title: Text('회원가입 성공'),
    actions: [
      TextButton(
        child: Text('로그인'),
        onPressed: () => Get.toNamed('signin'),
      )
    ],
  ));
}

void TestGetxDialog() {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text('GetX Dialog'),
      content: Text('This is a content'),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Get.back(),
        )
      ],
    ),
  );
}
