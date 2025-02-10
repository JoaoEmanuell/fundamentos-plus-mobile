import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/show_custom_dialog.dart';
import 'package:fundamentos_plus_mobile/utils/convert_author_name_in_asset_name.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';
import 'package:url_launcher/url_launcher.dart';

GestureDetector lessonVideo(FullLessonType lesson, BuildContext context) {
  Future<void> openVideo() async {
    String videoID = lesson.video.split("/")[4].split('?')[0];
    Uri videoURL = Uri.parse("https://www.youtube.com/watch?v=$videoID");
    if (!await launchUrl(videoURL)) {
      await showCustomDialog("Erro", "Erro ao iniciar o vídeo!", context);
    }
  }

  return GestureDetector(
      onTap: openVideo,
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Colors.blueGrey.shade200, width: 1))),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  convertAuthorNameInAssetName(lesson.author, "cycles_thumbs"),
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vídeo da lição",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      multilineText(
                          150,
                          Text("Vídeo com o resumo da lição",
                              style:
                                  TextStyle(color: Colors.blueGrey.shade400)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
}
