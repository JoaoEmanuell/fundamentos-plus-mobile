import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

Widget endPage(FullLessonType lesson, LessonPageArguments args) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: <Widget>[
        Image.asset("public/assets/images/completedlesson.webp"),
        Text(
          "Parabéns",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: DefaultColors.greenText),
        ),
        Text("Você completou a lição"),
        circleId(args.id),
        Text(
          "Agora não se esqueça de compartilhar com sua família e vínculos com a igreja.",
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
  ;
}
