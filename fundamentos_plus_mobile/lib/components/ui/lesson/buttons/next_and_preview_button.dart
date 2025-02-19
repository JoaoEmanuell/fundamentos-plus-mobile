import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/up_button_widget.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Row nextAndPreviewButton(VoidCallback next, VoidCallback preview,
    ScrollController scrollController) {
  WidgetStateProperty<Color> color =
      WidgetStateProperty.resolveWith((state) => DefaultColors.greenButton);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        onPressed: preview,
        style: ButtonStyle(backgroundColor: color),
        child: Text(
          'Anterior',
          style: TextStyle(color: Colors.white),
        ),
      ),
      upButtonWidget(true, scrollController, durationAnimation: 1),
      ElevatedButton(
        onPressed: next,
        style: ButtonStyle(backgroundColor: color),
        child: Text(
          'Próximo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
