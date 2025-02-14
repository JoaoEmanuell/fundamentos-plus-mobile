import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/bold.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green_separator.dart';

Widget bibleStyle(String content) {
  String text = content.split(" | ")[0];
  String versicle = content.split(" | ")[1];

  return Column(
    spacing: 16,
    children: [
      greenSeparatorStyle(""),
      MarkdownBody(data: text),
      boldStyle(versicle)
    ],
  );
}
