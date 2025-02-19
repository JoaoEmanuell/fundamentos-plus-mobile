import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/components/ui/home/actual_lesson_widget.dart';
import 'package:fundamentos_plus_mobile/components/ui/home/cycles_carrousel.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson_preview.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    LessonType lastLesson = DataController.dataManagerInstance.getLastLesson();

    ActualLesson actualLesson =
        DataController.userManagerInstance.getActualLesson();

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
                (actualLesson.id != -1
                    ? actualLessonWidget(actualLesson, context)
                    : Container()), // only render if actual lesson exists
                Text(
                  "Ciclos",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 500,
                  height: 75,
                  child: cyclesCarrousel(
                      DataController.dataManagerInstance.getCycles(), context),
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: bottomAppBarComponent(context));
  }
}
