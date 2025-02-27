import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/up_button_widget.dart';

import '../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the up button", (tester) async {
    ScrollController scrollController = ScrollController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: upButtonWidget(true, scrollController),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Visibility), findsOneWidget);
    expect(find.byIcon(Icons.arrow_upward_outlined), findsOneWidget);
  });
}
