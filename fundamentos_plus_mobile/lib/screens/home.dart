import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    "Fundamentos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: SvgPicture.asset(
                    "public/assets/images/icons/bible.svg",
                    width: 18,
                  )),
                  TextSpan(
                    text:
                        "Formando | Unindo | Ampliando a fé e a vida dos discípulos de Jesus.",
                  )
                ])),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  width: 300,
                  height: 200,
                  child: Center(child: Text("Last lesson container")),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 150,
                  height: 100,
                  child: Center(child: Text("Actual lesson")),
                ),
                Text(
                  "Ciclos",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 250,
                  height: 100,
                  child: Center(child: Text("Ciclos")),
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: bottomAppBarComponent(context));
  }
}
