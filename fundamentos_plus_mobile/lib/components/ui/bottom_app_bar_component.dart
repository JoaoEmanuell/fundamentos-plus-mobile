import 'package:flutter/material.dart';

Widget bottomAppBarComponent({String current = "home"}) {
  void homePress() {}
  void cyclesPress() {}
  void searchPress() {}
  void settingsPress() {}

  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: homePress,
          child: Icon(
            Icons.home,
            color: (current == "home"
                ? Colors.green.shade500
                : Colors.green.shade300),
            size: 32,
          ),
        ),
        ElevatedButton(
            onPressed: cyclesPress,
            child: Icon(
              Icons.description,
              color: (current == "cycles"
                  ? Colors.green.shade500
                  : Colors.green.shade300),
              size: 32,
            )),
        ElevatedButton(
            onPressed: searchPress,
            child: Icon(
              Icons.search,
              color: (current == "search"
                  ? Colors.green.shade500
                  : Colors.green.shade300),
              size: 32,
            )),
        ElevatedButton(
            onPressed: settingsPress,
            child: Icon(
              Icons.settings,
              color: (current == "settings"
                  ? Colors.green.shade500
                  : Colors.green.shade300),
              size: 32,
            ))
      ],
    ),
  );
}
