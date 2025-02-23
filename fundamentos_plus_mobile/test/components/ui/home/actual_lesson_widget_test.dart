import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/home/actual_lesson_widget.dart';

import 'package:fundamentos_plus_mobile/utils/types.dart';

import '../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the actual lesson", (tester) async {
    ActualLesson lesson = ActualLesson(id: 1, title: "Title");
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return actualLessonWidget(lesson, context);
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Stack), findsAtLeastNWidgets(1));
    expect(find.text("${lesson.id} ${lesson.title}"), findsWidgets);
  });
}
