import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/preview/action_button.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the action button not started lesson", (tester) async {
    LessonProgress lessonProgress =
        LessonProgress(id: 1, progress: 0, completed: false);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: actionButton(lessonProgress, Colors.green),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow_outlined), findsOneWidget);
  });
  testWidgets("Test the action button completed lesson", (tester) async {
    LessonProgress lessonProgress =
        LessonProgress(id: 1, progress: 0.5, completed: true);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: actionButton(lessonProgress, Colors.green),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsOneWidget);
    expect(find.byIcon(Icons.emoji_events_outlined), findsOneWidget);
  });
  testWidgets("Test the action button lesson in progress", (tester) async {
    LessonProgress lessonProgress =
        LessonProgress(id: 1, progress: 0.5, completed: false);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: actionButton(lessonProgress, Colors.green),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text("${(lessonProgress.progress * 100).toStringAsFixed(0)}%"),
        findsOneWidget);
  });
}
