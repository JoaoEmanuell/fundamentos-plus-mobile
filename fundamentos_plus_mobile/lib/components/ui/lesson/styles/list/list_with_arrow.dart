import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/utils/convert_hex_color_in_color.dart';

Widget listWithArrowStyle(String content) {
  List<String> split = content.split(" | ");
  String direction = split[0];
  String hexColor = split[1];
  List<String> texts = split.sublist(2);
  Color color = convertHexColorInColor(hexColor);
  Icon arrowWidget = Icon(Icons.arrow_right_alt, color: color);

  switch (direction) {
    case "up":
      arrowWidget = Icon(Icons.arrow_upward, color: color);
      break;
    case "right": // default
      arrowWidget = Icon(Icons.arrow_right_alt, color: color);
      break;
    case "down":
      arrowWidget = Icon(Icons.arrow_downward, color: color);
      break;
    case "left":
      arrowWidget = Icon(Icons.arrow_back, color: color);
      break;
  }

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
          .map((text) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: arrowWidget,
                  ),
                  Expanded(child: MarkdownBody(data: text)),
                ],
              ))
          .toList());
}
