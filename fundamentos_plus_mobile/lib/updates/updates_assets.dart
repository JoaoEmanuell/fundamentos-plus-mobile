import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class UpdatesAssets {
  Future<bool> _requestTheLastRelease() async {
    final url =
        "https://api.github.com/repos/JoaoEmanuell/fundamentos-plus-web/releases";
    return true;
  }

  Future<Directory> _getAssetsDir() async {
    final assets = await getTemporaryDirectory();
    final assetsDir = Directory("${assets.path}/assets");
    if (!assetsDir.existsSync()) {
      assetsDir.createSync();
    }
    return assetsDir;
  }

  Future<bool> _firstStart() async {
    final assetsDir = await _getAssetsDir();
    final files = assetsDir.listSync();
    print(files);
    File version = File("${assetsDir.path}/data.json");
    if (!files.contains(version)) {
      print("version not found");
      return true;
    }
    return false;
  }

  Future<bool> _extractDefaultDataZip() async {
    final assetsDir = await _getAssetsDir();
    // move the assets data zip to assets dir
    final dataZipBytes = await rootBundle.load("public/assets/data.zip");
    final dataZipBuffer = dataZipBytes.buffer;
    final dataZip = File("${assetsDir.path}/data.zip");
    await dataZip.create();
    await dataZip.writeAsBytes(dataZipBuffer.asUint8List(
        dataZipBytes.offsetInBytes, dataZipBytes.lengthInBytes));
    // extract the zip
    try {
      await ZipFile.extractToDirectory(
          zipFile: dataZip, destinationDir: assetsDir);
      print("Zip extracted with success!");
    } catch (e) {
      print(e);
      return false;
    }
    // delete the dataZip
    await dataZip.delete();
    return true;
  }

  Future<bool> run() async {
    print("run update");
    try {
      final firstStart = await _firstStart();
      if (firstStart) {
        await _extractDefaultDataZip();
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
