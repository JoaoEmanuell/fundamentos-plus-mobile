import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/screens/cycle.dart';

Widget cycleContainer(
    BuildContext context, int id, String title, int lessons, bool activated) {
  return GestureDetector(
      onTap: () {
        if (activated) {
          Navigator.pushNamed(context, "/cycle",
              arguments: CyclePageArguments(id));
        }
      },
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            decoration: BoxDecoration(
              color: DarkModeController.instance.getColorScheme().secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: circleId(id, activated: activated),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("$lessons lições",
                            style: TextStyle(
                                fontSize: 16, color: DefaultColors.greenButton))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )));
}
