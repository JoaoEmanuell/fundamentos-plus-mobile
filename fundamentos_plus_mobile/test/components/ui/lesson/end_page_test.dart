import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/end_page.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

import '../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the end page", (tester) async {
    FullLessonType lesson = FullLessonType(
        author: "Author",
        title: "Title",
        description: ["description"],
        video: "https://youtube.com",
        lessonTranscription: "lesson.pdf",
        pages: []);

    LessonPageArguments arguments = LessonPageArguments(5);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: endPage(lesson, arguments),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Padding), findsWidgets);
    expect(find.text("Parabéns"), findsWidgets);
    expect(
        find.text(
            "Agora não se esqueça de compartilhar com sua família e vínculos com a igreja."),
        findsWidgets);
    expect(find.text("Você completou a lição"), findsWidgets);
    expect(find.text("5"), findsWidgets);
  });
}
