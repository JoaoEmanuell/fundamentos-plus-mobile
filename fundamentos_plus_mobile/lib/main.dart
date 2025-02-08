import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/screens/home.dart';
import 'package:fundamentos_plus_mobile/updates/updates_assets.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _updateAssets = UpdatesAssets();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _updateAssets.run();
    return MaterialApp(
      title: 'Fundamentos plus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {"/": (context) => HomePage()},
      initialRoute: "/",
    );
  }
}
