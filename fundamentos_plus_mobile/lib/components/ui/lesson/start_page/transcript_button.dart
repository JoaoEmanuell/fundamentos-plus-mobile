import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fundamentos_plus_mobile/components/ui/utils/show_custom_dialog.dart';
import 'package:fundamentos_plus_mobile/controllers/dark_mode_controller.dart';
import 'package:permission_handler/permission_handler.dart';

GestureDetector transcriptButton(
    BuildContext context, String url, String filename) {
  Future<void> launchTranscription() async {
    final writeDirsPermission = await Permission.storage.status;
    if (writeDirsPermission.isDenied) {
      await Permission.storage.request();
      Permission.storage.onDeniedCallback(() async {
        await showCustomDialog(
            "Alerta",
            "Para realizar o download você deve conceder as permissões necessárias!",
            context);
      });
      Permission.storage.onGrantedCallback(launchTranscription);
    } else {
      Directory directory = Directory('/storage/emulated/0/Download');
      if (!directory.existsSync()) {
        directory.createSync();
      }

      File file = File("${directory.path}/$filename");
      if (file.existsSync()) {
        await showCustomDialog(
            "Alerta", "O arquivo da lição já foi baixado", context);
        return;
      }

      await FlutterDownloader.enqueue(
          url: url,
          headers: {},
          savedDir: directory.absolute.path,
          showNotification: true,
          openFileFromNotification: true,
          saveInPublicStorage: true);
    }
  }

  return GestureDetector(
      onTap: launchTranscription,
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.blueGrey.shade200, width: 1),
                  bottom:
                      BorderSide(color: Colors.blueGrey.shade200, width: 1))),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(color: DefaultColors.greenButton),
                    child: Center(
                      child: Icon(
                        Icons.description_outlined,
                        color: Colors.white,
                        size: 84,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ensino Transcrito",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Transcrição do ensino",
                          style: TextStyle(color: Colors.blueGrey.shade400))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
}
