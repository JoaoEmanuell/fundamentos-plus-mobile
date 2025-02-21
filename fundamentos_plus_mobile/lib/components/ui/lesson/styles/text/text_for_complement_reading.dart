import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget textForComplementReadingStyle(String content) {
  String text = content.replaceAll(" | ", " **|** ");

  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: DefaultColors.greenButton, width: 2),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "TEXTOS PARA LEITURA COMPLEMENTAR:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          MarkdownBody(
            data: text,
            styleSheet: MarkdownStyleSheet(
              textAlign: WrapAlignment.center,
            ),
          )
        ],
      ),
    ),
  );
}
