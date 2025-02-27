import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/table/table_with_green_header.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/table/table_with_index.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the table with green header", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: tableWithGreenHeaderStyle(
            "header 1 | coluna 1 , coluna 2 | header 2 | coluna 3 , coluna 4"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Table), findsOneWidget);
    expect(find.text("header 1"), findsOneWidget);
    expect(find.text("coluna 1"), findsOneWidget);
  });
  testWidgets("Test the table with index", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: tableWithIndexStyle(
            "index:texto do index | texto da célula | texto da célula , index:texto do index 2 | texto da célula 2 | texto da célula 2"),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Table), findsOneWidget);
    expect(find.text("texto do index"), findsWidgets);
    expect(find.text("texto da célula"), findsWidgets);
  });
}
