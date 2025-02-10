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
