import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

ClipRRect circleId(int id,
    {double width = 60,
    double height = 60,
    double fontSize = 28,
    double borderRadius = 50.0}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: DefaultColors.greenButton,
        width: width,
        height: height,
        child: Center(
          child: Text(id.toString(),
              style: TextStyle(
                  fontSize: (id < 100 ? fontSize : fontSize / 1.3),
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ));
}
