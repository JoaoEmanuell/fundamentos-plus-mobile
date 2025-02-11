import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/lesson_video.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/transcript_button.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/utils/convert_author_name_in_asset_name.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

class LessonPageArguments {
  late int id;
  LessonPageArguments(this.id);
}

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as LessonPageArguments;
    final lessonData = {
      "title": "O conselho de Deus",
      "author": "Edmar Ferreira",
      "description": [
        "Fundamentos é um programa de ensino formado pelo conselho apostólico da igreja, sob responsabilidade dos pastores Marcos Moraes, Vanjo Souza, Edmar Ferreira, João Bium, Manoel Rocha e Mário Fagundes.",
        "O programa conta com várias plataformas e mídias para divulgar o ensino básico da Palavra de Deus de maneira uniforme a toda a igreja.",
        "Para cada lição, há vídeos, áudios e textos escritos correspondentes. Todos indexados pelo mesmo número.",
        "O Fundamentos possui um site: www.fundamentos.me. Nele estarão disponíveis todas as lições e mídias produzidas e disponibilizadas.",
        "Dúvidas e solicitações podem ser feitas pelo e-mail contato@fundamentos.me."
      ],
      "video": "https://www.youtube.com/embed/Z6ksxWXT8-I?si=h0etylaOnGyCAj0Z",
      "lesson-transcription": "o-conselho-de-deus_compressed.pdf"
    };
    final lesson = FullLessonType.fromJson(lessonData);
    List<SizedBox> descriptionWidgets = [];
    for (final line in lesson.description) {
      descriptionWidgets.add(multilineText(
          1000,
          Text(
            line,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 5000,
          )));
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: <Widget>[
              Row(
                children: [
                  circleId(args.id, width: 40, height: 40, fontSize: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: multilineText(
                        250,
                        Text(
                          lesson.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )),
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
                    color: Colors.green),
              ),
              transcriptButton(
                  context,
                  "https://github.com/JoaoEmanuell/fundamentos-plus-web/raw/master/public/assets/lessons_pdfs/${lesson.lessonTranscription}",
                  lesson.lessonTranscription),
              lessonVideo(lesson, context)
            ],
          ),
        ),
      )),
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 150),
        child: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {},
          backgroundColor: Colors.green,
          tooltip: 'Iniciar lição',
          label: Center(
            child: Row(
              children: [
                Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  "Iniciar Lição",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
