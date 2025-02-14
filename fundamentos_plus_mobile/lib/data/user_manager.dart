import 'dart:convert';
import 'dart:io';

import 'package:fundamentos_plus_mobile/utils/types.dart';
import 'package:path_provider/path_provider.dart';

class UserManager {
  ActualLesson _actualLesson = ActualLesson(id: -1, title: "");
  Map<int, LessonProgress> _lessons = {};
  late File _dataFile;

  Future<void> load() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    if (!appDir.existsSync()) {
      appDir.createSync();
    }
    _dataFile = File("${appDir.path}/data.json");
    if (!_dataFile.existsSync()) {
      _dataFile.createSync();
    } else {
      Map<String, dynamic> data = jsonDecode(_dataFile.readAsStringSync());
      _actualLesson = ActualLesson.fromJson(data["_actualLesson"]);
      _lessons = {};
      for (var key in data["lessons"].keys) {
        _lessons[int.parse(key)] =
            LessonProgress.fromJson(data["lessons"][key]);
      }
    }
  }

  void save() {
    Map<String, dynamic> lessonsEncode = {
      "lessons": {},
    };
    for (final lesson in _lessons.keys) {
      lessonsEncode["lessons"][lesson.toString()] =
          _lessons[lesson]!.toJsonString();
    }

    lessonsEncode["actualLesson"] = _actualLesson.toJsonString();
    _dataFile.writeAsStringSync(jsonEncode(lessonsEncode));
  }

  void setActualLesson(ActualLesson lesson) {
    _actualLesson = lesson;
    save();
  }

  ActualLesson getActualLesson() {
    return ActualLesson(
      id: _actualLesson.id,
      title: _actualLesson.title,
    );
  }

  void setLessonProgress(LessonProgress lesson) {
    _lessons[lesson.id] = lesson;
    save();
  }

  LessonProgress getLessonProgress(int id) {
    if (_lessons.containsKey(id)) {
      return _lessons[id] as LessonProgress;
    } else {
      return LessonProgress(id: id, progress: 0, completed: false);
    }
  }

  void clearUserData() {
    _actualLesson = ActualLesson(id: -1, title: "");
    _lessons = {};
    save();
  }
}
