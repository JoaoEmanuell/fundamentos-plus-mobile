import 'dart:ui';

import 'package:flutter/material.dart';

Size getDeviceSize() {
  /**
   * Get the size in dp
   */
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
  return view.physicalSize / view.devicePixelRatio;
}
