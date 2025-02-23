// ignore_for_file: depend_on_referenced_packages

// ignore: library_annotations
@Skip("Skip the utils")

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

// https://github.com/flutter/flutter/issues/153108#issuecomment-2278456305
Future<void> setUpSharedPreferences() async {
  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.empty();
}
