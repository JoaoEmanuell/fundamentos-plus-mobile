import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory> getAssetsDir() async {
  final assets = await getTemporaryDirectory();
  final assetsDir = Directory("${assets.path}/assets");
  if (!assetsDir.existsSync()) {
    assetsDir.createSync();
  }
  return assetsDir;
}
