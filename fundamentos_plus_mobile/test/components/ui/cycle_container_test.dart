import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/cycle_container.dart';

import '../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the cycle container", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return cycleContainer(context, 1, "Test", 20, true);
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.text("Test"), findsOneWidget); // verify if text is present
  });
}
