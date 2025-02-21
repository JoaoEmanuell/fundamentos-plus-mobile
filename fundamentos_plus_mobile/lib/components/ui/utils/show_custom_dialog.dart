import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Future<void> showCustomDialog(
    String title, String text, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title,
            style: TextStyle(
                color: DarkModeController.instance.getColorScheme().onSurface)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text,
                  style: TextStyle(
                      color: DarkModeController.instance
                          .getColorScheme()
                          .onSurface)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: TextStyle(
                  color:
                      DarkModeController.instance.getColorScheme().onSurface),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
