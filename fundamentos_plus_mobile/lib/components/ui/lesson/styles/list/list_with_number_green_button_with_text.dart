import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';

Widget listWithNumberGreenButtonWithTextStyle(String content) {
  List<String> lines = content.split(' , ');

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 16,
    children: lines.map((line) {
      List<String> split = line.split(" | ");
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: circleId(split[0]),
          ),
          Expanded(child: MarkdownBody(data: split[1]))
        ],
      );
    }).toList(),
  );
}
