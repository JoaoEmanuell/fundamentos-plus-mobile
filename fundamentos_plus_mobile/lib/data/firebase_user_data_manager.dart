import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseUserDataManager {
  static Future<void> downloadForFirebase() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference userDataCollection = db.collection("user-data");
    if (user != null) {
      print("user: ${user.uid} | ${user.displayName}");
      DocumentReference docRef = userDataCollection.doc(user.uid);
      DocumentSnapshot doc = await docRef.get();
      if (doc.data() != null) {
        // get from firebase
        final savedData = doc.data() as Map<String, dynamic>;
        // get local
        final localLessons = DataController.userManagerInstance.encodeLesson();
        // union firebase with local
        final data = {};

        final lessons = {};
        lessons.addAll(savedData["lessons"] as Map<dynamic, dynamic>);
        lessons.addAll(localLessons["lessons"] as Map<dynamic, dynamic>);

        if (DataController.userManagerInstance.getActualLesson().id == -1) {
          // use not initialized lesson
          data["actualLesson"] = savedData["actualLesson"];
        } else {
          data["actualLesson"] = localLessons["actualLesson"];
        }

        data["lessons"] = lessons;

        // write in data.json

        Directory appDir = await getApplicationDocumentsDirectory();
        if (!appDir.existsSync()) {
          appDir.createSync();
        }
        File dataFile = File("${appDir.path}/data.json");
        if (!dataFile.existsSync()) {
          dataFile.createSync();
        }
        await dataFile.writeAsString(jsonEncode(data));

        if (!mapEquals(savedData, data)) {
          // send the updated data if is different from firebase
          await sendToFirebase();
        }
      } else {
        await sendToFirebase();
      }
    }
  }

  static Future<void> sendToFirebase() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference userDataCollection = db.collection("user-data");
    if (user != null) {
      final lessons = DataController.userManagerInstance.encodeLesson();
      await userDataCollection.doc(user.uid).set(lessons);
    }
  }

  static Future<void> deleteFirebaseData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference userDataCollection = db.collection("user-data");
    if (user != null) {
      await userDataCollection.doc(user.uid).delete();
    }
  }
}
