import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/bottom_app_bar_component.dart';
import 'package:fundamentos_plus_mobile/components/ui/cycle_container.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/up_button_widget.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';

class CyclesPage extends StatefulWidget {
  const CyclesPage({super.key});

  @override
  State<CyclesPage> createState() => _CyclesPageState();
}

class _CyclesPageState extends State<CyclesPage> {
  List<Widget> _constructCyclesContainers(BuildContext context) {
    List<Widget> cyclesContainer = [];
    final cycles = DataController.dataManagerInstance.getCycles().cycles;
    for (final cycle in cycles.keys) {
      final cycleData = cycles[cycle]!;
      cyclesContainer.add(cycleContainer(context, int.parse(cycle),
          cycleData.title, cycleData.lessons.length, cycleData.unlocked));
    }
    return cyclesContainer;
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
        body: SingleChildScrollView(
            controller: scrollController,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text(
                        "Ciclos",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ..._constructCyclesContainers(context),
                  ],
                ),
              ),
            )),
        floatingActionButton: upButtonWidget(true, scrollController),
        bottomNavigationBar: bottomAppBarComponent(context, current: 'cycles'));
  }
}
