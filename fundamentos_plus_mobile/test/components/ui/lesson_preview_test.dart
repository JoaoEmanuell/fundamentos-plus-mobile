import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson_preview.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

import '../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the lesson preview", (tester) async {
    LessonType lesson =
        LessonType(id: 1, author: "Test", title: "Title", unlocked: true);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return lessonPreview(context, lesson);
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.text(lesson.title), findsOneWidget);
  });
}
