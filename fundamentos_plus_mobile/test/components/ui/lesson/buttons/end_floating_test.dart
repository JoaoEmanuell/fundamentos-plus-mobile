import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/buttons/end_floating_button.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the end floating button", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: endFloatingButton(() {}),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text("Concluir Lição"), findsWidgets);
  });
}
