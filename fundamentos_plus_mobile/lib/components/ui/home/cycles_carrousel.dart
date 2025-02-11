import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/screens/cycle.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

CarouselView cyclesCarrousel(CyclesType cycles, BuildContext context) {
  List<Center> cyclesWidget = [];
  for (final cycle in cycles.cycles.keys) {
    cyclesWidget.add(Center(
        child: ClipRRect(
      child: Container(
        decoration: BoxDecoration(
            color: DarkModeController.instance.getColorScheme().secondary),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: circleId(int.parse(cycle),
                  borderRadius: 5, fontSize: 16, width: 45, height: 45),
            ),
            multilineText(
                230,
                Text(
                  cycles.cycles[cycle]!.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    )));
  }
  return CarouselView(
      scrollDirection: Axis.horizontal,
      itemExtent: 300,
      onTap: (value) {
        // carousel children don't clickable, use the index for determinate which element has clicked by user.
        Navigator.pushNamed(context, "/cycle",
            arguments: CyclePageArguments(value + 1));
      },
      children: cyclesWidget);
}
