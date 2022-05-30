import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:vamigo/components/dialog.dart';
import 'package:vamigo/components/http_post.dart';
import 'package:vamigo/components/styles.dart';
import 'package:vamigo/controller/user_info_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _mail;
  late TextEditingController _password;

  final _formKey = GlobalKey<FormState>();
  final httpPostManager = HttpPost();

  @override
  void initState() {
    super.initState();
    _mail = TextEditingController(text: ""); //변수를 여기서 초기화함.
    _password = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _mail.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      //autofocus: true,
                      controller: _mail,
                      validator: (value) =>
                          (value!.isEmpty) ? "이메일을 입력해 주세요" : null,
                      autovalidateMode: AutovalidateMode.always,
                      style: Styles.inputTextStyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      validator: (value) =>
                          (value!.isEmpty) ? "패스워드를 입력해 주세요" : null,
                      autovalidateMode: AutovalidateMode.always,
                      style: Styles.inputTextStyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 60),
                    OutlinedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var infoController = Get.find<UserInfoController>();
                            print('로그인 버튼 onPressed');

                            Map<String, dynamic> loginToJson() => {
                                  'mail': _mail.text,
                                  'password': _password.text
                                };
                            Future<Response> futureResponse =
                                httpPostManager.makePostRequest(
                                    loginToJson(), '/member/signin', context);

                            futureResponse.then((value) {
                              if (value.statusCode >= 400) {
                                SignInDialog(value);
                              } else {
                                String responseBody =
                                    utf8.decode(value.bodyBytes);
                                Map<String, dynamic> bodyList =
                                    jsonDecode(responseBody);
                                infoController.setProfile(bodyList);

                                Get.offAllNamed('/dashboard');
                              }
                            });
                          }
                          //Get.toNamed('/dashboard');
                        },
                        child: Text('로그인'))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
