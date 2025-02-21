import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget greenSeparatorStyle(String content) {
  return Center(
      child: Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
        color: DefaultColors.greenButton,
        borderRadius: BorderRadius.circular(50)),
  ));
}
