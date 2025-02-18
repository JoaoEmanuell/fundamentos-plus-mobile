import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:fundamentos_plus_mobile/screens/cycle.dart';
import 'package:fundamentos_plus_mobile/screens/cycles.dart';
import 'package:fundamentos_plus_mobile/screens/home.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/screens/page_style_test.dart';
import 'package:fundamentos_plus_mobile/screens/search.dart';
import 'package:fundamentos_plus_mobile/screens/settings.dart';
import 'package:fundamentos_plus_mobile/updates/updates_assets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _updateAssets = UpdatesAssets();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _updateAssets.run();
    DarkModeController.instance.loadSavedTheme();
    return AnimatedBuilder(
        animation: DarkModeController.instance,
        builder: (context, child) {
          return AnimatedBuilder(
            animation: DataController.instance,
            builder: (context, child) {
              return MaterialApp(
                title: 'Fundamentos plus',
                theme: ThemeData(
                    useMaterial3: true,
                    primarySwatch: Colors.green,
                    colorScheme: DarkModeController.instance.getColorScheme(),
                    brightness: DarkModeController.instance.isDartTheme
                        ? Brightness.dark
                        : Brightness.light),
                routes: {
                  "/": (context) => HomePage(),
                  "/cycles": (context) => CyclesPage(),
                  "/search": (context) => SearchPage(),
                  "/settings": (context) => SettingsPage(),
                  "/cycle": (context) => CyclePage(),
                  "/lesson": (context) => LessonPage(),
                  //"/style_test": (context) => PageStyleTest(),
                },
                initialRoute: "/",
              );
            },
          );
        });
  }
}
