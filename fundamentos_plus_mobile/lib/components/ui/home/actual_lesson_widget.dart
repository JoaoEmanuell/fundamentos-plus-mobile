import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

Stack actualLessonWidget(LessonType lesson, BuildContext context) {
  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/lesson",
              arguments: LessonPageArguments(lesson.id));
        },
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(color: DefaultColors.greenButton),
              height: 75,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                    multilineText(
                        250,
                        Text(
                          "${lesson.id} ${lesson.title}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))
                  ],
                ),
              ),
            )),
      ),
      Positioned(
        top: 0,
        right: 15,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Lição atual",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
