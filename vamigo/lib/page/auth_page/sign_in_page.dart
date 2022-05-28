import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/components/styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  //autofocus: true,
                  //controller: ,
                  validator: (value) =>
                      (value!.isEmpty) ? "이메일을 입력해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextFormField(
                  //controller: ,
                  obscureText: true,
                  validator: (value) =>
                      (value!.isEmpty) ? "패스워드를 입력해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 60),
                OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/dashboard');
                    },
                    child: Text('로그인'))
              ],
            ),
          ),
        ));
  }
}
