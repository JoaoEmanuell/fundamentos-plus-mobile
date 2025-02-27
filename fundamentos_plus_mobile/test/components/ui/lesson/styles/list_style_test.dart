import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/checklist.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/list_with_arrow.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/list_with_gray_background.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/list_with_number_green_button_with_text.dart';

import '../../../../utils_test.dart';

void main() {
  String defaultTextListWithArrow = "#55730e | texto | texto | texto";
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the checklist", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: checklistStyle("texto | texto 1"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsOneWidget);
    expect(find.text("texto 1"), findsOneWidget);
    expect(find.byIcon(Icons.check), findsWidgets);
  });
  testWidgets("Test the list with arrow up", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: listWithArrowStyle("up | $defaultTextListWithArrow"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsWidgets);
    expect(find.byIcon(Icons.arrow_upward), findsWidgets);
  });

  testWidgets("Test the list with arrow right", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: listWithArrowStyle("right | $defaultTextListWithArrow"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsWidgets);
    expect(find.byIcon(Icons.arrow_right_alt), findsWidgets);
  });

  testWidgets("Test the list with arrow down", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: listWithArrowStyle("down | $defaultTextListWithArrow"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsWidgets);
    expect(find.byIcon(Icons.arrow_downward), findsWidgets);
  });

  testWidgets("Test the list with arrow left", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: listWithArrowStyle("left | $defaultTextListWithArrow"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsWidgets);
    expect(find.byIcon(Icons.arrow_back), findsWidgets);
  });

  testWidgets("Test the list with gray background", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: listWithGrayBackgroundStyle("texto | texto 1"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsOneWidget);
    expect(find.text("texto 1"), findsOneWidget);
  });

  testWidgets("Test the list with number green button with text",
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: listWithNumberGreenButtonWithTextStyle(
            "01 | texto , 02 | texto , A | texto"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("texto"), findsWidgets);
    expect(find.text("01"), findsOneWidget);
    expect(find.text("02"), findsOneWidget);
    expect(find.text("A"), findsOneWidget);
  });
}
