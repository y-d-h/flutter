import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:vamigo/components/dialog.dart';
import 'package:vamigo/components/http_post.dart';
import 'package:vamigo/components/info.dart';
import 'package:vamigo/components/snackbar.dart';
import 'package:vamigo/components/styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double boxHeight = 25;
  final httpPostManager = HttpPost();

  String mbtiDropdownValue = "none";
  String sexDropdownValue = "비밀";
  String yearDropdownValue = getToday().toString();
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
    final List<String> _categories = Info.categories;

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
    final List<String> _genres = Info.genres;

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
                    //prefixIcon: Icon(Icons.email),
                    labelText: "메일 *",
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
                SizedBox(height: boxHeight),
                TextFormField(
                  controller: _code,
                  validator: (value) =>
                      (value!.isEmpty) ? "인증코드를 입력 해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                    labelText: "인증코드 *",
                    border: OutlineInputBorder(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextButton(
                        child: Text('코드요청'),
                        onPressed: () {
                          Map<String, dynamic> mailToJson() =>
                              {'mail': _email.text};
                          Future<Response> futureResponse =
                              httpPostManager.makePostRequest(
                                  mailToJson(), '/member/mailauth', context);

                          futureResponse.then((value) {
                            if (value.statusCode >= 400) {
                              getxSnackbar('', value.body);
                            } else {
                              getxSnackbar('', '메일이 도착하기까지 시간이 걸릴 수 있습니다');
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: boxHeight),
                TextFormField(
                  controller: _nickname,
                  validator: (value) =>
                      (value!.isEmpty) ? "닉네임을 입력 해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                      labelText: "닉네임 *", border: OutlineInputBorder()),
                ),
                SizedBox(height: boxHeight),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  validator: (value) =>
                      (value!.isEmpty) ? "패스워드를 입력 해 주세요" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                      labelText: "패스워드 *", border: OutlineInputBorder()),
                ),
                SizedBox(height: boxHeight),
                TextFormField(
                  obscureText: true,
                  controller: _password2,
                  validator: (value) =>
                      (value != _password.text) ? "패스워드가 다릅니다" : null,
                  style: Styles.inputTextStyle,
                  decoration: InputDecoration(
                      labelText: "패스워드 확인 *", border: OutlineInputBorder()),
                ),
                SizedBox(height: boxHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'MBTI',
                        style: TextStyle(fontSize: 22),
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Borders.boxBorderStyle),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton(
                        isDense: true,
                        items: Info.mbtis
                            .map<DropdownMenuItem<String>>((String mbti) {
                          return DropdownMenuItem<String>(
                              child: Text(mbti), value: mbti);
                        }).toList(),
                        value: mbtiDropdownValue,
                        onChanged: mbtiDropdownCallback,
                        isExpanded: true,
                        underline: DropdownButtonHideUnderline(
                          child: Container(),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        '성별',
                        style: TextStyle(fontSize: 22),
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Borders.boxBorderStyle),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton(
                        isDense: true,
                        items: Info.sexs,
                        value: sexDropdownValue,
                        onChanged: sexDropdownCallback,
                        isExpanded: true,
                        underline: DropdownButtonHideUnderline(
                          child: Container(),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        '출생년도',
                        style: TextStyle(fontSize: 22),
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton(
                        isDense: true,
                        items: Info.yearDropDownOptions()
                            .map<DropdownMenuItem<String>>((String year) {
                          return DropdownMenuItem<String>(
                              child: Text(year), value: year);
                        }).toList(),
                        value: yearDropdownValue,
                        onChanged: yearDropdownCallback,
                        isExpanded: true,
                        underline: DropdownButtonHideUnderline(
                          child: Container(),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          letterSpacing: 2.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Borders.boxBorderStyle),
                    child: TextButton(
                      onPressed: () {
                        _categoryShowMultiSelect();
                      },
                      child: const Text(
                        '선호작품 선택',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Borders.boxBorderStyle),
                    child: Column(
                      children: [
                        // display selected items
                        Wrap(
                          children: categorySelectedItems
                              .map((e) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Chip(
                                      label: Text(e),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: boxHeight),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Borders.boxBorderStyle),
                    child: TextButton(
                      onPressed: () {
                        _genreShowMultiSelect();
                      },
                      child: const Text(
                        '선호장르 선택',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Borders.boxBorderStyle),
                    child: Column(
                      children: [
                        // display selected items
                        Wrap(
                          children: genreSelectedItems
                              .map((e) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Chip(
                                      label: Text(e),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/signin');
                    },
                    child: Text('회원가입')),
                SizedBox(height: boxHeight),
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
