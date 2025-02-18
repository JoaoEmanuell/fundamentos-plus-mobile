import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/utils/convert_hex_color_in_color.dart';

Widget frameWithTitleAndBorderStyle(String content) {
  List<String> split = content.split(" | ");
  String borderColor = split[0];
  String title = split[1];
  String titleColor = split[2];
  String text = split[3];

  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: convertHexColorInColor(borderColor),
        width: 2,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          MarkdownBody(
              data: title,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  color: convertHexColorInColor(titleColor),
                  fontSize: 24,
                ),
              )),
          MarkdownBody(data: text)
        ],
      ),
    ),
  );
}
