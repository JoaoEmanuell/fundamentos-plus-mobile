import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/bold.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_separator.dart';

Widget bibleStyle(String content) {
  List<String> split = content.split(" | ");
  String text = split[0];
  String versicle = split.length > 1 ? split[1] : "";

  return Column(
    spacing: 16,
    children: [
      greenSeparatorStyle(""),
      MarkdownBody(data: text),
      boldStyle(versicle)
    ],
  );
}
