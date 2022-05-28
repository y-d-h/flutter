import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Info {
  static List<String> mbtis = [
    "none",
    "ISTJ",
    "ISTP",
    "ISFJ",
    "ISFP",
    "INTJ",
    "INTP",
    "INFJ",
    "INFP",
    "ESTJ",
    "ESTP",
    "ESFJ",
    "ESFP",
    "ENTJ",
    "ENTP",
    "ENFJ",
    "ENFP",
  ];

  static List<DropdownMenuItem<String>> sexs = [
    DropdownMenuItem(child: Text("비밀"), value: "비밀"),
    DropdownMenuItem(child: Text("남자"), value: "남자"),
    DropdownMenuItem(child: Text("여자"), value: "여자"),
  ];

  static List<String> yearDropDownOptions() {
    List<String> list = [getToday().toString()];
    for (int i = getToday() - 1; i > getToday() - 100; i--) {
      list.add(i.toString());
    }

    return list;
  }

  static List<String> categories = [
    '영화',
    '책',
    '게임',
    '애니메이션',
  ];

  static List<String> genres = [
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
}

int getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy');
  String strToday = formatter.format(now);
  int intToday = int.parse(strToday);

  return --intToday;
}
