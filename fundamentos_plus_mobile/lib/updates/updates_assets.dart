import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class UpdatesAssets {
  Future<bool> _requestTheLastRelease() async {
    // get the last release
    final url = Uri.parse(
        "https://api.github.com/repos/JoaoEmanuell/fundamentos-plus-web/releases/latest");
    http.Response response = await http.get(url);
    final json = jsonDecode(response.body); // get the last release
    dynamic assets = json["assets"]; // get the assets
    dynamic dataSize = assets[0]["size"]; // get the asset size
    // compare with saved data
    final assetsDir = await _getAssetsDir();
    File savedDataJson = File("${assetsDir.path}/data.json");
    if (!savedDataJson.existsSync()) return false;
    final savedDataDecode = jsonDecode(savedDataJson.readAsStringSync());
    if (dataSize != savedDataDecode["size"]) {
      File savedDataZip = File("${assetsDir.path}/data.zip");
      http.Response response = await http
          .get(Uri.parse(assets[0]["browser_download_url"]))
          .timeout(const Duration(seconds: 5));
      await savedDataZip.writeAsBytes(response.bodyBytes);
      await _extractZip(savedDataZip, assetsDir);
      await savedDataZip.delete();
      savedDataJson.writeAsStringSync('{"size": $dataSize}');
      return true;
    } else {
      return false;
    }
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
    File version = File("${assetsDir.path}/data.json");
    if (!version.existsSync()) {
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
    await _extractZip(dataZip, assetsDir);
    // delete the dataZip
    await dataZip.delete();
    return true;
  }

  Future<bool> _extractZip(File zip, Directory destinationDir) async {
    try {
      await ZipFile.extractToDirectory(
          zipFile: zip, destinationDir: destinationDir);
      print("Zip extracted with success!");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> run() async {
    print("run update");
    try {
      final firstStart = await _firstStart();
      if (firstStart) {
        await _extractDefaultDataZip();
      }
      return await _requestTheLastRelease();
    } catch (e) {
      print(e);
      return false;
    }
  }
}
