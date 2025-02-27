import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/others/frame_with_title_and_border.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the frame with title and border", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: frameWithTitleAndBorderStyle(
            "#55730e | **Title** | #55730e | Text"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsWidgets);
    expect(find.text("Title"), findsOneWidget);
    expect(find.text("Text"), findsOneWidget);
  });
}
