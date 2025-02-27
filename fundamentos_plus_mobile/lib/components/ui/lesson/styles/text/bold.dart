import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget boldStyle(String content) {
  return MarkdownBody(
    data: content,
    styleSheet: MarkdownStyleSheet(
        p: TextStyle(
      fontWeight: FontWeight.bold,
    )),
  );
}
