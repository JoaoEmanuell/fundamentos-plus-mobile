import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:fundamentos_plus_mobile/data/firebase_user_data_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatefulWidget {
  final String? firebaseUser;
  const SettingsPage({super.key, this.firebaseUser});

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

  void signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    await FirebaseUserDataManager.downloadForFirebase();
    await DataController.instance.load();
  }

  void signOutGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    String user = "";

    if (widget.firebaseUser != null) {
      user = widget.firebaseUser!;
    }

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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
                Visibility(
                    visible: user.isNotEmpty,
                    child: Text(user.isNotEmpty ? "Bem vindo: $user" : "")),
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
                    onPressed: user.isEmpty ? signInWithGoogle : signOutGoogle,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                        return user.isEmpty ? Colors.grey.shade400 : Colors.red;
                      }),
                    ),
                    child: Text(
                      user.isEmpty
                          ? "Fazer login com Google"
                          : "Sair da sincronização",
                      style: TextStyle(
                          color: user.isEmpty ? Colors.black : Colors.white),
                    )),
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
                          content: Column(
                            spacing: 16,
                            children: [
                              Text(
                                  "Deseja realmente apagar os dados? Isso é irreversível."),
                              Text(
                                  "Nota: Se estiver conectado com o Google, isso também apagará os dados online")
                            ],
                          ),
                          textOK: Text(
                            "Sim",
                            style: TextStyle(color: textColor),
                          ),
                          textCancel: Text(
                            "Não",
                            style: TextStyle(color: textColor),
                          ))) {
                        DataController.userManagerInstance.clearUserData();
                        await FirebaseUserDataManager.deleteFirebaseData();
                      }
                    },
                    child: Text(
                      "Apagar dados",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ))),
        bottomNavigationBar:
            bottomAppBarComponent(context, current: 'settings'));
  }
}
