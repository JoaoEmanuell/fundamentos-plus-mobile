import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

FloatingActionButton endFloatingButton(Function loadInitialPage) {
  return FloatingActionButton.extended(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    onPressed: () {
      loadInitialPage(end: true);
    },
    backgroundColor: DefaultColors.greenButton,
    tooltip: 'Concluir',
    label: Center(
      child: Text(
        "Concluir Lição",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
