import 'dart:convert';

class News {
  News({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  int id;
  String title;
  String description;
  DateTime date;

  News copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
  }) =>
      News(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
      );

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date.toIso8601String(),
      };
}
