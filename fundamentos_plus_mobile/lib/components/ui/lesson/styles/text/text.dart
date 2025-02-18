import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget textStyle(String content) {
  return MarkdownBody(
    data: content,
  );
}
