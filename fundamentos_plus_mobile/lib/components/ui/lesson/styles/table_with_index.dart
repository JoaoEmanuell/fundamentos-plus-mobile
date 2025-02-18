import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget tableWithIndexStyle(String content) {
  List<String> rows = content.split(" , ");

  double maxColumnHeight = 0;

  // Found the most height column
  TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  for (String row in rows) {
    for (int i = 0; i < row.length; i++) {
      textPainter.text = TextSpan(text: row[i], style: TextStyle(fontSize: 16));
      textPainter.layout();
      if (maxColumnHeight < (textPainter.height * 2)) {
        maxColumnHeight = textPainter.height * 6;
      }
    }
  }
  return Table(
    border: TableBorder.all(color: Colors.grey.shade400, width: 2),
    children: rows.map((row) {
      final cells = row.split(" | ");
      return TableRow(
          children: cells
              .map((cell) => cell.contains("index:")
                  ? TableCell(
                      // index cell
                      child: Container(
                          height: maxColumnHeight,
                          decoration:
                              BoxDecoration(color: DefaultColors.greenText),
                          child: Center(
                            child: SingleChildScrollView(
                              child: MarkdownBody(
                                data: cell.replaceAll("index:", ""),
                                styleSheet: MarkdownStyleSheet(
                                    p: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: WrapAlignment.center),
                              ),
                            ),
                          )),
                    )
                  : TableCell(
                      // normal cell
                      child: Container(
                          height: maxColumnHeight,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade200),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MarkdownBody(
                                  data: cell,
                                  styleSheet: MarkdownStyleSheet(
                                      textAlign: WrapAlignment.center),
                                ),
                              ),
                            ),
                          )),
                    ))
              .toList());
    }).toList(),
  );
}
