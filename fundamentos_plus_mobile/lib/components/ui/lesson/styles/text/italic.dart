import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget italicStyle(String content) {
  return MarkdownBody(
    data: content,
    styleSheet: MarkdownStyleSheet(p: TextStyle(fontStyle: FontStyle.italic)),
  );
}
