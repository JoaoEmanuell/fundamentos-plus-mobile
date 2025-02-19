import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/lesson_video.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/transcript_button.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/utils/convert_author_name_in_asset_name.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

Widget fullStartPage(
    BuildContext context, LessonPageArguments args, FullLessonType lesson) {
  List<MarkdownBody> descriptionWidgets = [];
  for (final line in lesson.description) {
    descriptionWidgets.add(MarkdownBody(
      data: line,
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.spaceAround, // justify
      ),
    ));
  }

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: <Widget>[
        Row(
          children: [
            circleId(args.id, width: 40, height: 40, fontSize: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  lesson.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.greenButton),
                ),
              ),
            )
          ],
        ),
        Text("por ${lesson.author}"),
        Image.asset(
          convertAuthorNameInAssetName(lesson.author, "apostolos"),
          width: 128,
          height: 128,
        ),
        ...descriptionWidgets,
        Text(
          "Conteúdo de apoio",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: DefaultColors.greenButton),
        ),
        transcriptButton(
            context,
            "https://github.com/JoaoEmanuell/fundamentos-plus-web/raw/master/public/assets/lessons_pdfs/${lesson.lessonTranscription}",
            lesson.lessonTranscription),
        lessonVideo(lesson, context)
      ],
    ),
  );
}
