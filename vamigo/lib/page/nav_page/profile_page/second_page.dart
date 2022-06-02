import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/controller/second_page_controller.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(SecondPageController());

  @override
  Widget build(BuildContext context) {
    print('>>> Build second Page');
    super.build(context);
    return Center(
      child: Obx(() => Text(controller.second.value)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
