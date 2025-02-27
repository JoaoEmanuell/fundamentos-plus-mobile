import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/lesson_video.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

void main() {
  testWidgets("Test the lesson video", (tester) async {
    FullLessonType lesson = FullLessonType(
        author: "Author",
        title: "Title",
        description: ["description"],
        video: "https://youtube.com",
        lessonTranscription: "lesson.pdf",
        pages: []);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return lessonVideo(lesson, context);
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.text("Vídeo da lição"), findsOneWidget);
    expect(find.text("Vídeo com o resumo da lição"), findsOneWidget);
  });
}
