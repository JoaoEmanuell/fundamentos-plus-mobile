import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';

void main() {
  testWidgets("Test the circle id", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: circleId("02"),
      ),
    ));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.text("02"), findsOneWidget); // verify if text is present
  });
}
