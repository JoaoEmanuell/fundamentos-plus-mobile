import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Widget bottomAppBarComponent(BuildContext context, {String current = "home"}) {
  GestureDetector constructButton(
      IconData icon, String name, String routeName) {
    final color = current == name
        ? DefaultColors.greenButton
        : DefaultColors.secondaryGreenButton;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: current == name
                          ? DefaultColors.greenButton
                          : Color.fromARGB(0, 0, 0, 0), // transparent border
                      width: 2))),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              icon,
              color: color,
              size: 40,
            ),
          )),
    );
  }

  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        constructButton(Icons.home_outlined, "home", "/"),
        constructButton(Icons.description_outlined, "cycles", "/cycles"),
        constructButton(Icons.search, "search", "/search"),
        constructButton(Icons.settings, "settings", "/settings"),
      ],
    ),
  );
}
