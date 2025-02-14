import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget greenTitleStyle(String content) {
  return Center(
      child: multilineText(
          300,
          Text(
            "1) A 1ª ressurreição e o arrebatamento",
            style: TextStyle(
              color: DefaultColors.greenText,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )));
}
