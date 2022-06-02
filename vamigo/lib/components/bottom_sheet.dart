import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widget profileBottomSheet() {
//   return Container(
//     height: 150,
//     width: Get.width,
//     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//     child: Column(
//       children: <Widget>[
//         Text(
//           '프로필 사진 선택',
//           style: TextStyle(fontSize: 20),
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             TextButton.icon(
//               onPressed: () {
//                 //takePhoto(ImageSource.camera);
//               },
//               icon: Icon(Icons.camera, size: 50),
//               label: Text('카메라', style: TextStyle(fontSize: 20)),
//             ),
//             TextButton.icon(
//               onPressed: () {
//                 //takePhoto(ImageSource.gallery);
//               },
//               icon: Icon(Icons.photo_library, size: 50),
//               label: Text('갤러리', style: TextStyle(fontSize: 20)),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }

void profileBottomSheet() {
  Get.bottomSheet(
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    Container(
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              '프로필 사진 선택',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            icon: Icon(Icons.camera),
            label: Text('카메라'),
            onPressed: () {
              Get.back();
            },
          ),
          SizedBox(height: 10),
          OutlinedButton.icon(
            icon: Icon(Icons.photo_library),
            label: Text('갤러리'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    ),
  );
}
