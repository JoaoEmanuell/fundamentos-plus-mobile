import 'dart:ui';

import 'package:flutter/material.dart';

Size getDeviceSize() {
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
  return view.physicalSize;
}
