import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/transcript_button.dart';

import '../../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the transcription button", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return transcriptButton(
              context, "https://github.com", "filename.pdf");
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.text("Ensino Transcrito"), findsOneWidget);
    expect(find.text("Transcrição do ensino"), findsOneWidget);
  });
}
