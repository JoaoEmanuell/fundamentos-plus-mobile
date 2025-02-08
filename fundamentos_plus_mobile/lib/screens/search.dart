import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              children: <Widget>[Text("Pesquisa")],
            ),
          ),
        )),
        bottomNavigationBar: bottomAppBarComponent(context, current: 'search'));
  }
}
