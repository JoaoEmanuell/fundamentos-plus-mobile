import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeIsEnabled = DarkModeController.instance.isDartTheme;

  void _changeDarkMode(bool value) {
    setState(() {
      _darkModeIsEnabled = value;
    });
    DarkModeController.instance.setTheme(value);
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Configurações",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Modo escuro: "),
                      Switch(
                          activeColor: DarkModeController.instance
                              .getColorScheme()
                              .onPrimary,
                          value: _darkModeIsEnabled,
                          onChanged: _changeDarkMode),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                        return Colors.red;
                      }),
                    ),
                    onPressed: () async {
                      Color textColor = DarkModeController.instance
                          .getColorScheme()
                          .onSurface;
                      if (await confirm(context,
                          title: Text("Apagar"),
                          content: Text(
                              "Deseja realmente apagar os dados? Isso é irreversível."),
                          textOK: Text(
                            "Sim",
                            style: TextStyle(color: textColor),
                          ),
                          textCancel: Text(
                            "Não",
                            style: TextStyle(color: textColor),
                          ))) {
                        DataController.userManagerInstance.clearUserData();
                      }
                    },
                    child: Text(
                      "Apagar dados",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        )),
        bottomNavigationBar:
            bottomAppBarComponent(context, current: 'settings'));
  }
}
