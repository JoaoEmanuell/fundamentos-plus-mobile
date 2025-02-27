import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/bible.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/bold.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/italic.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/multi_bible.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/multi_text.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text_for_complement_reading.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text_green.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text_highlight.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the bible", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: bibleStyle("versicle | reference"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("versicle"), findsOneWidget);
    expect(find.text("reference"), findsOneWidget);
  });

  testWidgets("Test the bold", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: boldStyle("bold"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(MarkdownBody), findsOneWidget);
    expect(find.text("bold"), findsOneWidget);
  });
  testWidgets("Test the italic", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: italicStyle("italic"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(MarkdownBody), findsOneWidget);
    expect(find.text("italic"), findsOneWidget);
  });
  testWidgets("Test the multi bible", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: multiBibleStyle(
            "text | versicle , text | versicle , text | versicle"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("text"), findsWidgets);
    expect(find.text("versicle"), findsWidgets);
  });
  testWidgets("Test the multi text", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: multiTextStyle("text | versicle | text"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsWidgets);
    expect(find.text("text"), findsWidgets);
    expect(find.text("versicle"), findsOneWidget);
  });
  testWidgets("Test the text for complement reading", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: textForComplementReadingStyle("texto 1 | texto 2 | texto 3"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsWidgets);
    expect(find.text("TEXTOS PARA LEITURA COMPLEMENTAR:"), findsOneWidget);
    expect(find.text("texto 1 | texto 2 | texto 3"), findsWidgets);
  });
  testWidgets("Test the text green", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: textGreenStyle("texto"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(MarkdownBody), findsWidgets);
    expect(find.text("texto"), findsOneWidget);
  });
  testWidgets("Test the text highlight", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: textHighlightStyle("**a)** | #769335 | **a)** texto"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Text), findsWidgets);
    expect(find.text("texto"), findsOneWidget);
    expect(find.text("a)"), findsOneWidget);
  });
  testWidgets("Test the text", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: textStyle("texto"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(MarkdownBody), findsWidgets);
    expect(find.text("texto"), findsOneWidget);
  });
}
