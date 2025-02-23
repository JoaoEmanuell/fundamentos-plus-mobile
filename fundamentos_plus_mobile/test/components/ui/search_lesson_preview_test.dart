import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/search_lesson_preview.dart';

import '../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the search lesson preview", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return searchLessonPreview(context, 1, "Title", "Description");
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.text("Title"), findsOneWidget);
    expect(find.text("Description"), findsOneWidget);
  });
}
