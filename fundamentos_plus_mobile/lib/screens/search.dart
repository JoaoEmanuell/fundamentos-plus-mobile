import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/components/ui/search_lesson_preview.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/up_button_widget.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _visibleTextSearchHint = true;
  bool _visibleUpButton = false;
  final ScrollController _scrollController = ScrollController();
  late Widget statusButton;
  late Text statusText;
  final fieldText = TextEditingController();
  final List<GestureDetector> _searchLessonPreviews = [];

  Text _textWidgetStatus(String text) {
    return Text(text,
        style: TextStyle(
            color: DarkModeController.instance.getColorScheme().onSurface));
  }

  ElevatedButton _defaultStatus(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor:
            WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return DarkModeController.instance.getColorScheme().secondary;
        })),
        onPressed: () => {_search(fieldText.text, context)},
        child: Text("Pesquisar",
            style: TextStyle(color: DefaultColors.greenText)));
  }

  void _search(String value, BuildContext context) async {
    value = value.trim();
    _searchLessonPreviews.clear();

    if (value == "") {
      setState(() {
        _visibleTextSearchHint = true;
        statusText = _textWidgetStatus("Busque por uma palavra chave...");
        _visibleUpButton = false;
      });
    } else {
      setState(() {
        statusButton = CircularProgressIndicator(
          color: DefaultColors.greenButton,
        );
        _visibleUpButton = true;
      });
      int lessonCount = 0;
      await for (final lesson
          in DataController.dataManagerInstance.search(value)) {
        _addSearchLessonForPreviews(lesson, context);
        lessonCount++;
      }
      if (lessonCount == 0) {
        setState(() {
          _visibleTextSearchHint = true;
          statusText = _textWidgetStatus("Nenhuma foi lição encontrada!");
          _visibleUpButton = false;
        });
      }
    }
  }

  void _addSearchLessonForPreviews(
      LessonSearchResult lesson, BuildContext context) {
    setState(() {
      _visibleTextSearchHint = false;
      _searchLessonPreviews.add(searchLessonPreview(
          context, lesson.id, lesson.title, lesson.description));
    });
  }

  @override
  Widget build(BuildContext context) {
    statusButton = _defaultStatus(context);
    statusText = _textWidgetStatus("Busque por uma palavra chave...");
    final upButton = upButtonWidget(_visibleUpButton, _scrollController);
    return Scaffold(
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text(
                        "Pesquisar",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: DarkModeController.instance
                                .getColorScheme()
                                .secondary),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.search, color: Colors.grey.shade500),
                                SizedBox(
                                    width: 225,
                                    child: TextField(
                                      controller: fieldText,
                                      decoration: InputDecoration(
                                          hintText: "Pesquisar...",
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade500),
                                          border: InputBorder.none,
                                          disabledBorder: InputBorder.none),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      fieldText.clear();
                                      setState(() {
                                        _searchLessonPreviews.clear();
                                        _visibleTextSearchHint = true;
                                        statusButton = _defaultStatus(context);
                                        _visibleUpButton = false;
                                      });
                                    },
                                    child: Icon(Icons.cancel_outlined,
                                        color: Colors.grey.shade500))
                              ]),
                        ),
                      )),
                  Visibility(
                      visible: _visibleTextSearchHint,
                      child: Center(
                          child: Column(
                        spacing: 16,
                        children: [statusText, statusButton],
                      ))),
                  Column(
                    spacing: 16,
                    children: _searchLessonPreviews,
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: bottomAppBarComponent(context, current: 'search'),
      floatingActionButton: upButton,
    );
  }
}
