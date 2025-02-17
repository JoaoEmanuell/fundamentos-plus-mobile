import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget textGreenStyle(String content) {
  return MarkdownBody(
    data: content,
    styleSheet: MarkdownStyleSheet(
        p: TextStyle(
      color: DefaultColors.greenText,
    )),
  );
}
