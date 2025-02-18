import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/multi_bible.dart';

class PageStyleTest extends StatefulWidget {
  const PageStyleTest({super.key});

  @override
  State<PageStyleTest> createState() => _PageStyleTestState();
}

class _PageStyleTestState extends State<PageStyleTest> {
  @override
  Widget build(BuildContext context) {
    List<String> contents = [
      "Eles, pois, o venceram por causa do sangue do Cordeiro e por causa da palavra do testemunho que deram e, mesmo em face da morte, n\u00e3o amaram a pr\u00f3pria vida. | Apocalipse 12:11 ,  \u201cVi tamb\u00e9m tronos, e nestes sentaram-se aqueles aos quais foi dada autoridade de julgar. Vi ainda as almas dos decapitados por causa do testemunho de Jesus, bem como por causa da palavra de Deus, tantos quantos n\u00e3o adoraram a besta, nem tampouco a sua imagem, e n\u00e3o receberam a marca na fronte e na m\u00e3o; e viveram e reinaram com Cristo durante mil anos.. | Apocalipse 20:4",
    ];

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
                  child: Column(
                    spacing: 16,
                    children: contents
                        .map((content) => multiBibleStyle(content))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
