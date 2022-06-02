import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/controller/first_page_controller.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    print('>>> Build first Page');
    super.build(context);
    return Center(
      child: Obx(() => Text(controller.first.value)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
