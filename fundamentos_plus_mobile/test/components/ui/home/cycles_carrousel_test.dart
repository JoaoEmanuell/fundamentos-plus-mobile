import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/components/ui/home/cycles_carrousel.dart';

import 'package:fundamentos_plus_mobile/utils/types.dart';

import '../../../utils_test.dart';

void main() {
  setUp(() async {
    await setUpSharedPreferences();
  });
  testWidgets("Test the cycles carrousel", (tester) async {
    Map<String, CycleType> cycles = {
      "1": CycleType(lessons: [
        LessonType(id: 1, author: "Author", title: "Title", unlocked: true)
      ], title: "Title", unlocked: true)
    };
    CyclesType cyclesForCarrousel = CyclesType(cycles: cycles);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return cyclesCarrousel(cyclesForCarrousel, context);
        }),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(CarouselView), findsOneWidget);
    expect(find.text(cycles["1"]!.title), findsOneWidget);
  });
}
