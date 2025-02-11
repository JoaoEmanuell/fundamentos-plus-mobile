import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/utils/convert_author_name_in_asset_name.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

GestureDetector lessonPreview(BuildContext context, LessonType lesson,
    {double imageWidth = 300, double imageHeight = 200}) {
  Color playButtonColor =
      (lesson.unlocked ? DefaultColors.greenButton : Colors.grey);
  return GestureDetector(
    onTap: () {
      if (lesson.unlocked) {
        Navigator.pushNamed(context, "/lesson",
            arguments: LessonPageArguments(lesson.id));
      }
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            color: DarkModeController.instance.getColorScheme().secondary),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  convertAuthorNameInAssetName(lesson.author, "cycles_thumbs"),
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: circleId(lesson.id,
                                  width: 40, height: 40, fontSize: 20),
                            ),
                            multilineText(
                                200,
                                Text(
                                  lesson.title,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        )

                        /*Text.rich(TextSpan(children: [
                          WidgetSpan(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                              // width: 18,
                            ),
                          )),
                          TextSpan(
                              text: "Concluído em 09/02/2025",
                              style: TextStyle(color: Colors.lightGreen))
                        ]))*/ //used in future
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: playButtonColor, width: 5),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.play_arrow_outlined,
                            size: 32, color: playButtonColor)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
