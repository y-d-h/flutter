import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:vamigo/components/dialog.dart';
import 'package:vamigo/components/http_post.dart';
import 'package:vamigo/components/snackbar.dart';
import 'package:vamigo/components/styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final httpPostManager = HttpPost();

  String mbtiDropdownValue = "none";
  String sexDropdownValue = "비밀";
  String yearDropdownValue = '2021';
  List<String> categorySelectedItems = [];
  List<String> genreSelectedItems = [];

  late TextEditingController _email;
  late TextEditingController _code;
  late TextEditingController _nickname;
  late TextEditingController _password;
  late TextEditingController _password2;

  void mbtiDropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        mbtiDropdownValue = selectedValue;
      });
    }
  }

  void sexDropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        sexDropdownValue = selectedValue;
      });
    }
  }

  void yearDropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        yearDropdownValue = selectedValue;
      });
    }
  }

  void _categoryShowMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _categories = [
      '영화',
      '책',
      '게임',
      '애니메이션',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _categories);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        categorySelectedItems = results;
      });
    }
  }

  void _genreShowMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _genres = [
      '드라마',
      'SF',
      '액션',
      '미스터리',
      '스릴러',
      'RPG',
      'FPS',
      '시뮬레이션',
      '레이싱',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _genres);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        genreSelectedItems = results;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _code = TextEditingController(text: "");
    _nickname = TextEditingController(text: "");
    _password = TextEditingController(text: "");
    _password2 = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _code.dispose();
    _nickname.dispose();
    _password.dispose();
    _password2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('회원가입'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  //focusNode: _emailFocusNode,
                  //autofocus: true,
                  controller: _email,
                  validator: (value) =>
                      (value!.isEmpty) ? "이메일을 입력 해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextButton(
                        child: Text('중복체크'),
                        onPressed: () {
                          Map<String, dynamic> mailToJson() =>
                              {'mail': _email.text};
                          Future<Response> futureResponse =
                              httpPostManager.makePostRequest(
                                  mailToJson(), '/member/check', context);

                          futureResponse.then((value) {
                            if (value.statusCode >= 400) {
                              getxSnackbar('', value.body);
                            } else if (_email.text == '') {
                              getxSnackbar('', '메일을 입력하세요');
                            } else {
                              getxSnackbar('', '사용 가능한 메일입니다');
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _password,
                  validator: (value) =>
                      (value!.isEmpty) ? "비밀번호를 입력 해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        )
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       OutlinedButton(
        //           onPressed: () {
        //             Get.toNamed('/signin');
        //           },
        //           child: Text('회원가입'))
        //     ],
        //   ),
        // )
        );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('취소'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('확인'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
