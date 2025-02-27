import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/construct_page.dart';

import '../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the construct page", (tester) async {
    List<dynamic> page = [
      {'type': 'green-title', 'content': "Title"},
      {'type': 'text', 'content': "text"},
    ];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: constructPage(page),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsAny);
    expect(find.text("text"), findsWidgets);
    expect(find.text("Title"), findsWidgets);
  });
}
