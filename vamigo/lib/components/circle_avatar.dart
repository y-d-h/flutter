import 'package:flutter/material.dart';
import 'package:vamigo/components/bottom_sheet.dart';

Widget imageProfile() {
  return Center(
    child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.grey,
        ),
        // Positioned(
        //   bottom: 10,
        //   right: 10,
        //   child: InkWell(
        //     onTap: () {
        //       profileBottomSheet();
        //     },
        //     child: Icon(
        //       Icons.camera_alt,
        //       color: Colors.blue,
        //       size: 40,
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
