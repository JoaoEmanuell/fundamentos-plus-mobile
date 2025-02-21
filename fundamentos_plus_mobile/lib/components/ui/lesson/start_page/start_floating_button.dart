import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

FloatingActionButton startFloatingButton(VoidCallback onPressed) {
  return FloatingActionButton.extended(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    onPressed: onPressed,
    backgroundColor: DefaultColors.greenButton,
    tooltip: 'Iniciar lição',
    label: Center(
      child: Row(
        children: [
          Icon(
            Icons.play_arrow_outlined,
            color: Colors.white,
            size: 32,
          ),
          Text(
            "Iniciar Lição",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}
