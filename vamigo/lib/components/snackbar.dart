import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getxSnackbar(String title, dynamic message) {
  Get.snackbar(
    title,
    message,
    messageText: Text(
      message,
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    ),
    snackPosition: SnackPosition.TOP, // 스낵바가 표시되는 위치
    forwardAnimationCurve: Curves.elasticInOut, // 화면에 표시될 때 애니메이션 커브
    reverseAnimationCurve: Curves.easeOut, // 화면에서 사라질 때 애니메이션 커브
  );
}

