import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson_preview.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';

class CyclePageArguments {
  late int id;
  CyclePageArguments(this.id);
}

class CyclePage extends StatefulWidget {
  const CyclePage({super.key});

  @override
  State<CyclePage> createState() => _CyclePageState();
}

class _CyclePageState extends State<CyclePage> {
  final _lessons = [
    {
      "id": 1,
      "title": "O conselho de Deus",
      "author": "Edmar Ferreira",
      "unlocked": true
    },
    {
      "id": 2,
      "title": "Aprender, crescer e servir",
      "author": "Marcos Moraes",
      "unlocked": true
    },
    {
      "id": 3,
      "title": "Por que Jesus veio ao mundo?",
      "author": "Manoel Rocha",
      "unlocked": true
    },
    {
      "id": 4,
      "title": "O nascimento da igreja",
      "author": "Marcos Moraez", // test incorrect author name
      "unlocked": true
    },
    {
      "id": 5,
      "title": "Porta, caminho e alvo",
      "author": "Marcos Moraes",
      "unlocked": false // test unlocked lesson
    }
  ]; // example for cycle 1
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CyclePageArguments;
    List<GestureDetector> lessonsWidgets = [];
    final title = "Temas Panorâmicos";
    for (final lesson in _lessons) {
      lessonsWidgets.add(lessonPreview(context, LessonType.fromJson(lesson)));
    }
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
        title: Text("${args.id} - $title",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
