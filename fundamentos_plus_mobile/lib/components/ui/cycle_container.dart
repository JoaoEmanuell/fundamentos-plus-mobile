import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/circle_id.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';
import 'package:fundamentos_plus_mobile/screens/cycle.dart';

Widget cycleContainer(BuildContext context, int id, String title, int lessons) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/cycle",
            arguments: CyclePageArguments(id));
      },
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: circleId(id),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      multilineText(
                        220,
                        Text(
                          title,
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text("$lessons lições",
                          style: TextStyle(fontSize: 16, color: Colors.green))
                    ],
                  )
                ],
              ),
            ),
          )));
}
