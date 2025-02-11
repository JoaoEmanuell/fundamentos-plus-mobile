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
  late List<String> description;
  late String video;
  late String lessonTranscription;

  FullLessonType(
      {required this.author,
      required this.title,
      required this.description,
      required this.video,
      required this.lessonTranscription});

  factory FullLessonType.fromJson(Map<String, dynamic> json) {
    return FullLessonType(
        author: json['author'] as String,
        title: json['title'] as String,
        video: json['video'] as String,
        lessonTranscription: json['lesson-transcription'] as String,
        description: json["description"] as List<String>);
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
