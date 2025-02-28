import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget checklistStyle(String content) {
  List<String> texts = content.split(" | ");

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
          .map((text) => Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.check,
                        color: DefaultColors.greenButton,
                      )),
                  Expanded(child: MarkdownBody(data: text))
                ],
              ))
          .toList());
}
