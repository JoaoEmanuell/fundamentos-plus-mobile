import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text_highlight.dart';
import 'package:fundamentos_plus_mobile/utils/convert_hex_color_in_color.dart';

class PageStyleTest extends StatefulWidget {
  const PageStyleTest({super.key});

  @override
  State<PageStyleTest> createState() => _PageStyleTestState();
}

class _PageStyleTestState extends State<PageStyleTest> {
  @override
  Widget build(BuildContext context) {
    String content =
        "**01 -** | #769335 | **01 -** Você já **observou** atentamente a relação entre o Espírito Santo e Jesus? **01 -**";

    final split = content.split(' | ');
    final expressionToHighlight = split[0];
    final color = convertHexColorInColor(split[1]);
    final texts = split[2].split(expressionToHighlight);

    List<WidgetSpan> _buildHighlightedText(
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

    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: <Widget>[
                Center(
                  child: textHighlightStyle(content),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
