import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/full_start_page.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the full start page", (tester) async {
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
        body: Builder(builder: (context) {
          return fullStartPage(context, arguments, lesson);
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text("por ${lesson.author}"), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });
}
