import 'package:flutter/material.dart';

class LessonPageArguments {
  late int id;
  LessonPageArguments(this.id);
}

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as LessonPageArguments;
    List<GestureDetector> lessonsWidgets = [];
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: <Widget>[...lessonsWidgets],
          ),
        ),
      )),
      appBar: AppBar(
        title: Text("${args.id}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
