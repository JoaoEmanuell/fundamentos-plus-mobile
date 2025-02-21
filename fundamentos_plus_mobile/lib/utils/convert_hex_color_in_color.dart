// https://www.edureka.co/community/229252/how-do-i-use-hexadecimal-color-strings-in-flutter

import 'dart:ui';

Color convertHexColorInColor(String color) {
  return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
}
