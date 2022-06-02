import 'package:get/get.dart';

class FirstPageController extends GetxController {
  final first = ''.obs;

  @override
  void onInit() {
    print('Call API first page'); // called only once
    first.value = 'first page';
    super.onInit();
  }
}
