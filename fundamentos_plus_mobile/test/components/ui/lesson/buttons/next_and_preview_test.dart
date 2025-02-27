import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/buttons/next_and_preview_button.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the next and preview button", (tester) async {
    ScrollController scrollController = ScrollController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          controller: scrollController,
        ),
        floatingActionButton:
            nextAndPreviewButton(() {}, () {}, scrollController),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
    expect(find.text("Anterior"), findsOneWidget);
    expect(find.text("Próximo"), findsOneWidget);
  });
}
