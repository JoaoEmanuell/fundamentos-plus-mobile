import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/utils/convert_hex_color_in_color.dart';

Widget textHighlightStyle(String content) {
  List<String> split = content.split(" | ");
  String expressionToHighlight = split[0];
  Color color = convertHexColorInColor(split[1]);
  List<String> texts = split[2].split(expressionToHighlight);

  List<WidgetSpan> buildHighlightedText(
      List<String> texts, String highlight, Color color) {
    List<WidgetSpan> spans = [];

    for (final text in texts) {
      if (text.isNotEmpty) {
        spans.add(WidgetSpan(
            child: MarkdownBody(
          data: text,
        )));
      } else {
        spans.add(WidgetSpan(
          child: MarkdownBody(
            data: highlight,
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(color: color),
            ),
          ),
        ));
      }
    }

    return spans;
  }

  return Text.rich(TextSpan(
    children: buildHighlightedText(texts, expressionToHighlight, color),
  ));
}
