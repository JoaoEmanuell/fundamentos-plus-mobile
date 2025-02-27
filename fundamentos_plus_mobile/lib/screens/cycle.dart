import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson_preview.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/up_button_widget.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';

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
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CyclePageArguments;
    List<GestureDetector> lessonsWidgets = [];
    final cycle = DataController.dataManagerInstance.getCycle(args.id);
    final title = cycle.title;
    for (final lesson in cycle.lessons) {
      lessonsWidgets.add(lessonPreview(context, lesson));
    }
    ScrollController scrollController = ScrollController();
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
          controller: scrollController,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: <Widget>[...lessonsWidgets],
              ),
            ),
          ))),
      floatingActionButton: upButtonWidget(true, scrollController),
      appBar: AppBar(
        title: Text("${args.id} - $title",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
