import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              children: <Widget>[Text("Configurações")],
            ),
          ),
        )),
        bottomNavigationBar:
            bottomAppBarComponent(context, current: 'settings'));
  }
}
