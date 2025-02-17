import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list_with_arrow.dart';
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
        "right | #55730e | O primeiro erro: a casta sacerdotal que ainda existe nas denominações; | O segundo erro: os desigrejados ou aqueles que não reconhecem nenhum tipo de liderança sobre eles, por causa do “entendimento” errado de que todos são sacerdotes.";

    final split = content.split(" | ");
    final direction = split[0];
    final hexColor = split[1];
    final texts = split.sublist(2);
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
                  child: listWithArrowStyle(content),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
