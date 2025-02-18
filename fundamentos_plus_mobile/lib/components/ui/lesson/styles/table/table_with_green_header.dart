import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget tableWithGreenHeaderStyle(String content) {
  // get the content elements
  List<String> headers = content.split(" | ");
  List<String> fullHeaders = [];
  List<List<String>> fullLines = [];
  for (String header in headers) {
    List<String> headerSplit = header.split(' , ');
    if (headerSplit.length == 1) {
      fullHeaders.add(headerSplit[0]);
    } else {
      fullLines.add(headerSplit);
    }
  }

  // get the rows

  List<List<String>> rows = [];

  for (int i = 0; i < fullLines[0].length; i++) {
    List<String> row = [];
    for (final column in fullLines) {
      row.add(column[i]);
    }
    rows.add(row);
  }

  // construct the rows widget

  List<List<Widget>> tableRows = [];

  for (final row in rows) {
    List<Widget> rowWidget = [];
    for (final cell in row) {
      rowWidget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: MarkdownBody(
            data: cell
                .replaceAll("<void>", "")
                .replaceAll("<void> |", "")
                .replaceAll("<void> | ", "")
                .replaceAll("|", ""), // remove the void
            styleSheet: MarkdownStyleSheet(textAlign: WrapAlignment.center),
          ),
        ),
      ));
    }
    tableRows.add(rowWidget);
  }

  // construct the rows for use in the table

  List<TableRow> rowsWidget = tableRows.map((row) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      children: row.map((textWidget) {
        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: textWidget),
          ),
        );
      }).toList(),
    );
  }).toList();

  // construct headers

  TableRow headersWidget = TableRow();

  if (fullHeaders.isNotEmpty) {
    headersWidget = TableRow(
        decoration: BoxDecoration(color: DefaultColors.greenText),
        children: fullHeaders
            .map((header) => TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                    decoration: BoxDecoration(color: DefaultColors.greenText),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: MarkdownBody(
                              data: header,
                              styleSheet: MarkdownStyleSheet(
                                  p: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: WrapAlignment.center)),
                        ),
                      ),
                    ))))
            .toList());
  }

  List<TableRow> tableChildren = [];
  if (headersWidget.children.isNotEmpty) {
    tableChildren.add(headersWidget);
  }
  tableChildren.addAll(rowsWidget);

  return Table(
    border: TableBorder.all(color: Colors.grey.shade400, width: 2),
    children: tableChildren,
  );
}
