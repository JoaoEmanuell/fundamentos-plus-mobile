import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget greenBackgroundTitleStyle(String content) {
  return Container(
    decoration: BoxDecoration(color: DefaultColors.secondaryGreenButton),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: MarkdownBody(
        data: content,
        styleSheet: MarkdownStyleSheet(
            p: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
