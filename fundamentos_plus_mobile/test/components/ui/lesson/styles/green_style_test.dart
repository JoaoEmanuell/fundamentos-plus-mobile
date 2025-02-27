import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_background_title.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_separator.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_title.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/sub_green_title.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the green background title", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: greenBackgroundTitleStyle("Title"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text("Title"), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
  testWidgets("Test the green separator", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: greenSeparatorStyle(""),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Center), findsOneWidget);
  });
  testWidgets("Test the green title", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: greenTitleStyle("Title"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text("Title"), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });
  testWidgets("Test the sub green title", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: subGreenTitleStyle("Sub Title"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text("Sub Title"), findsOneWidget);
    expect(find.byType(MarkdownBody), findsOneWidget);
  });
}
