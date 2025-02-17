import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text.dart';

Widget multiTextStyle(String content) {
  List<Widget> markdown = [];

  for (final text in content.split(" | ")) {
    markdown.add(Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: textStyle(text),
    ));
  }

  return Column(
    children: markdown,
  );
}
