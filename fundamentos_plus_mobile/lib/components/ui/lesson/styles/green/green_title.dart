import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget greenTitleStyle(String content) {
  return Center(
      child: Text(
    content,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: DefaultColors.greenText,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ));
}
