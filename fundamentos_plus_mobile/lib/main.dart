import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:fundamentos_plus_mobile/screens/cycle.dart';
import 'package:fundamentos_plus_mobile/screens/cycles.dart';
import 'package:fundamentos_plus_mobile/screens/home.dart';
import 'package:fundamentos_plus_mobile/screens/lesson.dart';
import 'package:fundamentos_plus_mobile/screens/search.dart';
import 'package:fundamentos_plus_mobile/screens/settings.dart';
import 'package:fundamentos_plus_mobile/updates/updates_assets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  final updateAssets = UpdatesAssets();
  await updateAssets.run();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                  "/settings": (context) => StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.data == null) {
                            return SettingsPage();
                          } else {
                            return SettingsPage(
                              firebaseUser: FirebaseAuth
                                  .instance.currentUser!.displayName,
                            );
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
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
