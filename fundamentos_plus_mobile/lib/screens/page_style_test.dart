import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/bold.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green_separator.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/multi_bible.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/sub_green_title.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

class PageStyleTest extends StatefulWidget {
  const PageStyleTest({super.key});

  @override
  State<PageStyleTest> createState() => _PageStyleTestState();
}

class _PageStyleTestState extends State<PageStyleTest> {
  @override
  Widget build(BuildContext context) {
    String content =
        'No temor do Senhor, tem o homem forte amparo, e isso é refúgio para os seus filhos. | Provérbios 14:26 , No temor do Senhor, tem o homem forte amparo, e isso é refúgio para os seus filhos. | Provérbios 14:26 , No temor do Senhor, tem o homem forte amparo, e isso é refúgio para os seus filhos. | Provérbios 14:26 , No temor do Senhor, tem o homem forte amparo, e isso é refúgio para os seus filhos. | Provérbios 14:26';

    String text = content.split(" | ")[0];
    String versicle = content.split(" | ")[1];

    Column multiText = Column(
      spacing: 16,
      children: [
        greenSeparatorStyle(""),
        MarkdownBody(data: text),
        boldStyle(versicle)
      ],
    );
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
                  child: subGreenTitleStyle(
                      "Sub Green TitleSub Green TitleSub Green TitleSub Green TitleSub Green TitleSub Green TitleSub Green TitleSub Green TitleSub Green Title"),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
