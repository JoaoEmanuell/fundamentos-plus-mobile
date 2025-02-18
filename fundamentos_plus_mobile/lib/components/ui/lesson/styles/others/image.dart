import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';

Widget imageStyle(String content) {
  String imageName = content.split(' | ')[0];
  Directory assets = DataController.dataManagerInstance.getAssets();
  File image = File("${assets.path}/assets/lessons_images/$imageName");

  return Container(
      decoration: BoxDecoration(
        color: DarkModeController.instance.getColorScheme().secondary,
      ),
      child: Stack(children: [
        InteractiveViewer(child: Image.file(image)),
        Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.pinch,
              color: DefaultColors.greenText,
            ))
      ]));
}
