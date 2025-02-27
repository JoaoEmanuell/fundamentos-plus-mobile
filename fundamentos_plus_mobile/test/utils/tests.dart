import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamentos_plus_mobile/utils/clear_query_strings.dart';
import 'package:fundamentos_plus_mobile/utils/convert_author_name_in_asset_name.dart';
import 'package:fundamentos_plus_mobile/utils/convert_hex_color_in_color.dart';
import 'package:fundamentos_plus_mobile/utils/format_date.dart';

void main() {
  test("Test the clear query strings", () {
    String query =
        "green-title 1 text-bold 2 bible-text 3 green-separator 4 green-sub-title 5 table-with-index 6 text-italic 7 list-with-number-green-button-with 8 text-for-complement-reading 9 text-green table-with-green-header 0 list-with-gray-background 1 check-list 2 text-highlight 3 green-background-title 4 frame-with-title-and-border 5 list-with-arrow 6 multi-text 7 multi-bible 8 text 9 image 0 {1} [2] | 3";
    String clear = clearQueryStrings(query).trim().replaceAll(" ", "");
    expect(clear, "12345678901234567890123");
  });
  test("Test the convert author name in asset name", () {
    String authorThumb =
        convertAuthorNameInAssetName("Eliseu Moreira", "thumb");
    expect(authorThumb, "public/assets/images/thumb/eliseu-moreira.webp");
    String authorIcon = convertAuthorNameInAssetName("Eliseu Moreira", "icon");
    expect(authorIcon, "public/assets/images/icon/eliseu-moreira.webp");
    String authorNotFound = convertAuthorNameInAssetName("Null", "icon");
    expect(authorNotFound, "public/assets/images/icon/benito-lopez.webp");
  });
  test("Test the convert hex color in color", () {
    Color color = convertHexColorInColor("#ffffff");
    expect(color, Colors.white);
  });
  test("Test the format date", () {
    DateTime dateTime = DateTime(2025, 12, 30);
    String formattedDate = formatDate(dateTime);
    expect(formattedDate, "${dateTime.day}/${dateTime.month}/${dateTime.year}");
  });
}
