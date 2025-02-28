import 'dart:convert';
import 'dart:io';

import 'package:fundamentos_plus_mobile/utils/clear_query_strings.dart';
import 'package:fundamentos_plus_mobile/utils/get_assets_dir.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';
import 'package:string_validator/string_validator.dart';

class DataManager {
  CyclesType _cyclesType = CyclesType.fromJson({
    "1": {
      "unlocked": true,
      "title": "Temas Panorâmicos",
      "lessons": [
        {
          "id": 1,
          "title": "O conselho de Deus",
          "author": "Edmar Ferreira",
          "unlocked": true
        }
      ]
    },
    "2": {
      "unlocked": true,
      "title": "Jesus, sua vida e sua obra",
      "lessons": [
        {
          "id": 6,
          "title": "Jesus é Deus",
          "author": "Vanjo Souza",
          "unlocked": true
        }
      ]
    },
    "3": {
      "unlocked": true,
      "title": "A Volta de Jesus",
      "lessons": [
        {
          "id": 23,
          "title": "Por que e como estudar sobre a volta de Jesus?",
          "author": "Gilberto Bajo",
          "unlocked": true
        }
      ]
    }
  }); // default cycles static

  late Directory _assets;

  Future<void> loadCycles() async {
    final assets = await getAssetsDir();
    File dataMinJson = File("${assets.path}/data/data.min.json");
    if (dataMinJson.existsSync()) {
      _cyclesType = CyclesType.fromJson(
          jsonDecode(dataMinJson.readAsStringSync())["cycles"]);
    }
    _assets = assets;
  }

  CyclesType getCycles() {
    return _cyclesType;
  }

  CycleType getCycle(int id) {
    final idString = id.toString();
    if (_cyclesType.cycles.containsKey(idString)) {
      return _cyclesType.cycles[idString]!;
    }
    throw Exception("Cycle not found!");
  }

  FullLessonType getLessonFromCycle(int id) {
    File lessonFile = File("${_assets.path}/data/lessons/$id.min.json");
    if (lessonFile.existsSync()) {
      return FullLessonType.fromJson(
          jsonDecode(lessonFile.readAsStringSync()) as Map<String, dynamic>);
    }
    throw Exception("Lesson not found!");
  }

  Directory getAssets() {
    return _assets;
  }

  Stream<LessonSearchResult> search(String query) async* {
    Directory lessonsDir = Directory("${_assets.path}/data/lessons/");
    query = clearQueryStrings(query).trim();
    if (query == "") {
      return;
    }
    if (isNumeric(query)) {
      // simple search
      for (final file in lessonsDir.listSync()) {
        String filename = file.path.split("/").last;
        if (filename.contains(query)) {
          File lessonFile = File(file.path);
          yield LessonSearchResult.fromJson(
              jsonDecode(lessonFile.readAsStringSync()),
              int.parse(filename.replaceAll(".min.json", "")));
        }
      }
    } else {
      // deep search
      for (final lesson in lessonsDir.listSync()) {
        File lessonFile = File(lesson.path);
        String content = lessonFile.readAsStringSync();
        if (content.contains(query)) {
          String filename = lessonFile.path.split("/").last;
          yield LessonSearchResult.fromJson(jsonDecode(content),
              int.parse(filename.replaceAll(".min.json", "")));
        }
      }
    }
    return;
  }

  LessonType getLastLesson() {
    Iterable<String> keys = _cyclesType.cycles.keys;
    for (int i = keys.length; i > 0; i--) {
      CycleType cycle = getCycle(i);
      if (cycle.unlocked) {
        Iterable<LessonType> lessons = cycle.lessons.reversed;
        for (LessonType lesson in lessons) {
          if (lesson.unlocked) {
            return lesson;
          }
        }
      }
    }
    return LessonType(
        author: "Edmar Ferreira",
        id: 1,
        title: "O conselho de Deus",
        unlocked: true);
  }
}
