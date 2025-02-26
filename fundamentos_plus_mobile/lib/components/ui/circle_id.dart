import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:fundamentos_plus_mobile/utils/get_device_size.dart';

ClipRRect circleId(dynamic id,
    {double width = 60,
    double height = 60,
    double fontSize = 28,
    double borderRadius = 50.0,
    bool activated = true}) {
  fontSize = _getFontSize(id, fontSize);

  return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: activated ? DefaultColors.greenButton : Colors.grey,
        width: width,
        height: height,
        child: Center(
          child: Text(id.toString().trim(),
              style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ));
}

double _getFontSize(dynamic id, double fontSize) {
  Size deviceSize = getDeviceSize();
  if (int.tryParse(id) == null) {
    id = id.toString().length;
  } else {
    id = int.parse(id);
  }
  if (deviceSize.width <= 1080) {
    // for small ui's
    return (id < 100 ? fontSize / 1.2 : fontSize / 1.8);
  }
  return (id < 100 ? fontSize : fontSize / 1.3);
}
