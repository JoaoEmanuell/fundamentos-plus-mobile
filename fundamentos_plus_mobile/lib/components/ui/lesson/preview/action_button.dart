import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

Container actionButton(LessonProgress lesson, Color playButtonColor) {
  if (lesson.progress == 0 && !lesson.completed) {
    // lesson not started
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: playButtonColor, width: 5),
            borderRadius: BorderRadius.circular(50)),
        child:
            Icon(Icons.play_arrow_outlined, size: 32, color: playButtonColor));
  } else if (lesson.completed) {
    // completed lesson
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: playButtonColor, width: 5),
            borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.emoji_events_outlined,
            size: 32, color: playButtonColor));
  } else {
    // lesson not completed
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            color: DefaultColors.greenButton,
            value: lesson.progress,
            backgroundColor:
                DarkModeController.instance.getColorScheme().onPrimary,
          ),
          Positioned(
              child: Text(
            "${(lesson.progress * 100).toStringAsFixed(0)}%",
            style: TextStyle(
                color: DarkModeController.instance.getColorScheme().onSurface,
                fontSize: 10),
          ))
        ],
      ),
      /*decoration: BoxDecoration(
            border: Border.all(color: playButtonColor, width: 5),
            borderRadius: BorderRadius.circular(50)),
        child:
            Icon(Icons.play_arrow_outlined, size: 32, color: playButtonColor)*/
    );
  }
}
