import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamigo/components/dialog.dart';
import 'package:vamigo/components/snackbar.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Container(color: Colors.black),
          ),
          TabBar(
            controller: controller.tabController,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.directions_car,
                color: Colors.black,
              )),
              Tab(
                  icon: Icon(
                Icons.directions_bike,
                color: Colors.black,
              )),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                CarPage(),
                BikePage(),
              ],
            ),
          ),
        ],
      ),

      // Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     // Text('test page'),
      //     // OutlinedButton(
      //     //     onPressed: () {
      //     //       //TestGetxDialog();
      //     //       getxSnackbar('', '메일이 도착하기까지 시간이 걸릴 수 있습니다');
      //     //     },
      //     //     child: Text('test getx dialog')),

      //   ],
      // )),
    );
  }
}

// ignore: deprecated_member_use
class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }
}

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(CarPageController());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return Center(
      child: Obx(() => Text(controller.car.value)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CarPageController extends GetxController {
  final car = ''.obs;

  @override
  void onInit() {
    print('Call API Car'); // called only once
    car.value = 'Ferrari';
    super.onInit();
  }
}

class BikePage extends StatefulWidget {
  @override
  _BikePageState createState() => _BikePageState();
}

class _BikePageState extends State<BikePage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(BikePageController());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Bike Page');
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Obx(() => Text(controller.bike.value)),
        ),
        OutlinedButton(
            onPressed: () {
              //TestGetxDialog();
              getxSnackbar('', '메일이 도착하기까지 시간이 걸릴 수 있습니다');
            },
            child: Text('test getx dialog')),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BikePageController extends GetxController {
  final bike = ''.obs;

  @override
  void onInit() {
    print('Call API Bike'); // called only once
    bike.value = 'BMC';
    super.onInit();
  }
}
