import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/components/ui/search_lesson_preview.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _visibleTextSearchHint = true;
  String _textSearchHint = "Busque por uma palavra chave...";
  final fieldText = TextEditingController();
  final List<ClipRRect> _searchLessonPreviews = [];

  void _search(String value) {
    value = value.trim();
    _searchLessonPreviews.clear();
    if (value == "") {
      setState(() {
        _visibleTextSearchHint = true;
      });
    } else {
      setState(() {
        _visibleTextSearchHint = false;
        final searchExemple = searchLessonPreview(
            999,
            'Juntas e ligamentos: Companheirismo - Parte 2',
            "Nesta centésima vigésima quarta lição, aprenderemos sobre o tema “Profetas e Evangelistas”. Veremos o funcionamento destes dois ministérios e, para isto, seremos desafiados a não nos prendermos às pré-noções que os termos carregam e que os afasta do seu real sentido. Teremos a oportunidade de comparar o Velho e o Novo Testamento, à guisa de aprofundar nossa compreensão sobre o tema.");
        _searchLessonPreviews.add(searchExemple);
        _searchLessonPreviews.add(searchExemple);
        _searchLessonPreviews.add(searchExemple);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                    onChanged: _search,
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
                        child: Text(
                      _textSearchHint,
                      style: TextStyle(
                          color: DarkModeController.instance
                              .getColorScheme()
                              .onSurface),
                    ))),
                ..._searchLessonPreviews
              ],
            ),
          ),
        )),
        bottomNavigationBar: bottomAppBarComponent(context, current: 'search'));
  }
}
