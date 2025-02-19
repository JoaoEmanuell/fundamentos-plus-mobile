import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget listWithGrayBackgroundStyle(String content) {
  List<String> texts = content.split(" | ");

  return Column(
    spacing: 16,
    children: texts
        .map((text) => Container(
              decoration: BoxDecoration(color: Colors.grey.shade400),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MarkdownBody(
                  data: text,
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(color: Colors.black),
                    textAlign: WrapAlignment.center,
                  ),
                ),
              ),
            ))
        .toList(),
  );
}
