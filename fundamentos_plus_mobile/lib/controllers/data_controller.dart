import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/data/data_manager.dart';

class DataController extends ChangeNotifier {
  static DataManager dataManagerInstance = DataManager();
  static DataController instance = DataController();

  void load() async {
    await dataManagerInstance.loadCycles();
    notifyListeners();
  }
}
