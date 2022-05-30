import 'package:get/get.dart';
import 'package:vamigo/controller/bottom_nav_controller.dart';
import 'package:vamigo/controller/user_info_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put(BottomNavController(), permanent: true);
    Get.put(UserInfoController, permanent: true);

    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
