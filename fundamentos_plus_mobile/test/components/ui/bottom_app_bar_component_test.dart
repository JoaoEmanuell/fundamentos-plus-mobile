import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';

void main() {
  testWidgets("Test the bottom app bar", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Builder(builder: (context) {
          return bottomAppBarComponent(context);
        }),
      ),
    ));
    expect(find.byType(BottomAppBar), findsOneWidget);

    // verify if icon is present
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
  });
}
