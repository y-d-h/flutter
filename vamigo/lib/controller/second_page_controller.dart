import 'package:get/get.dart';

class SecondPageController extends GetxController {
  final second = ''.obs;

  @override
  void onInit() {
    print('Call API second page'); // called only once
    second.value = 'second page';
    super.onInit();
  }
}
