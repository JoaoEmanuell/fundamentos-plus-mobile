import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/start_floating_button.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the start floating button", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: startFloatingButton(() {}),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text("Iniciar Lição"), findsOneWidget);
  });
}
