import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/components/ui/home/actual_lesson_widget.dart';
import 'package:fundamentos_plus_mobile/components/ui/home/cycles_carrousel.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson_preview.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final lastLessonJson = {
      "id": 1,
      "title": "O conselho de Deus",
      "author": "Edmar Ferreira",
      "unlocked": true
    };
    LessonType lastLesson = LessonType.fromJson(lastLessonJson);

    final actualLessonJson = {
      "id": 4,
      "title": "O nascimento da igreja",
      "author": "Marcos Moraes",
      "unlocked": true
    };
    LessonType actualLesson = LessonType.fromJson(actualLessonJson);

    final cyclesJson = {
      "cycles": {
        "1": {
          "unlocked": true,
          "title": "Temas Panorâmicos",
          "lessons": [
            {
              "id": 1,
              "title": "O conselho de Deus",
              "author": "Edmar Ferreira",
              "unlocked": true
            }
          ]
        },
        "2": {
          "unlocked": true,
          "title": "Jesus, sua vida e sua obra",
          "lessons": [
            {
              "id": 6,
              "title": "Jesus é Deus",
              "author": "Vanjo Souza",
              "unlocked": true
            }
          ]
        },
        "3": {
          "unlocked": true,
          "title": "A Volta de Jesus",
          "lessons": [
            {
              "id": 23,
              "title": "Por que e como estudar sobre a volta de Jesus?",
              "author": "Gilberto Bajo",
              "unlocked": true
            }
          ]
        }
      }
    };

    CyclesType cycles =
        CyclesType.fromJson(cyclesJson["cycles"] as Map<String, dynamic>);

    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Fundamentos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: SvgPicture.asset(
                    "public/assets/images/icons/bible.svg",
                    width: 18,
                  )),
                  TextSpan(
                    text:
                        "Formando | Unindo | Ampliando a fé e a vida dos discípulos de Jesus.",
                  )
                ])),
                lessonPreview(context, lastLesson),
                actualLessonWidget(actualLesson, context),
                Text(
                  "Ciclos",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 500,
                  height: 75,
                  child: cyclesCarrousel(cycles, context),
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: bottomAppBarComponent(context));
  }
}
