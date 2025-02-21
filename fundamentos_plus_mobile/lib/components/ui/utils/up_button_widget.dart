import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';

Visibility upButtonWidget(
    bool visibleUpButton, ScrollController scrollController,
    {int durationAnimation = 1}) {
  return Visibility(
    visible: visibleUpButton,
    child: FloatingActionButton(
      onPressed: () => {
        scrollController.animateTo(0,
            duration: Duration(seconds: durationAnimation),
            curve: Curves.linear)
      },
      backgroundColor: DarkModeController.instance.getColorScheme().secondary,
      child: Icon(
        Icons.arrow_upward_outlined,
        color: DefaultColors.greenButton,
      ),
    ),
  );
}
