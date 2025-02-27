import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/data/data_manager.dart';
import 'package:fundamentos_plus_mobile/data/user_manager.dart';

class DataController extends ChangeNotifier {
  static DataManager dataManagerInstance = DataManager();
  static UserManager userManagerInstance = UserManager();
  static DataController instance = DataController();

  Future<void> load() async {
    await dataManagerInstance.loadCycles();
    await userManagerInstance.load();
    notifyListeners();
  }

  Future<void> reloadUserManager() async {
    // Used to reload the user data
    await userManagerInstance.load();
    notifyListeners();
  }
}
