import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_background_title.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_separator.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/green_title.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/green/sub_green_title.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/checklist.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/list_with_arrow.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/list_with_gray_background.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/list/list_with_number_green_button_with_text.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/others/frame_with_title_and_border.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/others/image.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/table/table_with_green_header.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/table/table_with_index.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/bible.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/bold.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/italic.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/multi_bible.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/multi_text.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text_for_complement_reading.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text_green.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/styles/text/text_highlight.dart';

Column constructPage(List<dynamic> page) {
  Map<String, Function> styles = {
    'green-title': greenTitleStyle,
    'text': textStyle,
    'text-bold': boldStyle,
    'bible-text': bibleStyle,
    'green-separator': greenSeparatorStyle,
    'green-sub-title': subGreenTitleStyle,
    'table-with-index': tableWithIndexStyle,
    'text-italic': italicStyle,
    'list-with-number-green-button-with-text':
        listWithNumberGreenButtonWithTextStyle,
    'text-for-complement-reading': textForComplementReadingStyle,
    'text-green': textGreenStyle,
    'table-with-green-header': tableWithGreenHeaderStyle,
    'list-with-gray-background': listWithGrayBackgroundStyle,
    'check-list': checklistStyle,
    'image': imageStyle,
    'text-highlight': textHighlightStyle,
    'green-background-title': greenBackgroundTitleStyle,
    'frame-with-title-and-border': frameWithTitleAndBorderStyle,
    'list-with-arrow': listWithArrowStyle,
    'multi-text': multiTextStyle,
    'multi-bible': multiBibleStyle,
  };

  List<Widget> widgets = [];
  for (final style in page) {
    if (styles.containsKey(style['type'])) {
      widgets.add(styles[style['type']]!(style['content']));
    } else {
      widgets.add(textStyle(style['content']));
    }
  }

  return Column(
    spacing: 16,
    children: widgets,
  );
}
