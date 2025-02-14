class LessonType {
  late int id;
  late String author;
  late String title;
  late bool unlocked;

  LessonType(
      {required this.id,
      required this.author,
      required this.title,
      required this.unlocked});

  factory LessonType.fromJson(Map<String, dynamic> json) {
    return LessonType(
        author: json['author'] as String,
        title: json['title'] as String,
        id: json["id"] as int,
        unlocked: json["unlocked"] as bool);
  }
}

class FullLessonType {
  late String author;
  late String title;
  late List<dynamic> description;
  late String video;
  late String lessonTranscription;
  late List<dynamic> pages;

  FullLessonType(
      {required this.author,
      required this.title,
      required this.description,
      required this.video,
      required this.lessonTranscription,
      required this.pages});

  factory FullLessonType.fromJson(Map<String, dynamic> json) {
    return FullLessonType(
        author: json['author'] as String,
        title: json['title'] as String,
        video: json['video'] as String,
        lessonTranscription: json['lesson-transcription'] as String,
        description: json["description"] as List<dynamic>,
        pages: json["pages"] as List<dynamic>);
  }
}

class CycleType {
  late bool unlocked;
  late String title;
  late List<LessonType> lessons;

  CycleType(
      {required this.unlocked, required this.title, required this.lessons});

  factory CycleType.fromJson(Map<String, dynamic> json) {
    List<LessonType> lessons = [];
    for (final lesson in json["lessons"]) {
      lessons.add(LessonType.fromJson(lesson));
    }
    return CycleType(
        unlocked: json["unlocked"] as bool,
        title: json["title"] as String,
        lessons: lessons);
  }
}

class CyclesType {
  late Map<String, CycleType> cycles;
  CyclesType({required this.cycles});
  factory CyclesType.fromJson(Map<String, dynamic> json) {
    Map<String, CycleType> formattedCycles = {};

    for (final key in json.keys) {
      formattedCycles[key] = CycleType.fromJson(json[key]);
    }
    return CyclesType(cycles: formattedCycles);
  }
}

class LessonSearchResult {
  late int id;
  late String title;
  late String description;

  LessonSearchResult(
      {required this.id, required this.title, required this.description});

  factory LessonSearchResult.fromJson(Map<String, dynamic> json, int id) {
    String description =
        json["description"][0].toString(); // get only first description line
    if (description.length > 50) {
      description = description.substring(0, 50); // first 50 characters
    }
    return LessonSearchResult(
        id: id, title: json["title"] as String, description: description);
  }
}

class LessonProgress {
  late int id;
  late double progress;
  late bool completed;
  late String? completedDate;
  late int? actualPage;

  LessonProgress(
      {required this.id,
      required this.progress,
      required this.completed,
      this.completedDate,
      this.actualPage});

  factory LessonProgress.fromJson(Map<String, dynamic> json) {
    return LessonProgress(
        id: json['id'] as int,
        progress: json['progress'] as double,
        completed: json['completed'] as bool,
        completedDate: json['completedDate'] as String?,
        actualPage: json['actualPage'] as int?);
  }

  String toJsonString() {
    return '{"id": $id, "progress": $progress, "completed": $completed, "completedDate": "$completedDate", "actualPage": $actualPage}';
  }
}

class ActualLesson {
  late int id;
  late String title;

  ActualLesson({required this.id, required this.title});

  factory ActualLesson.fromJson(Map<String, dynamic> json) {
    return ActualLesson(id: json["id"] as int, title: json["title"] as String);
  }

  String toJsonString() {
    return '{"id": $id, "title": "$title"}';
  }
}
