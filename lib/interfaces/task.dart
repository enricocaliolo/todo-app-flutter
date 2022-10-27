class Task {
  String title;
  String id;

  Task({required this.title, required this.id});

  Map toJson() => {
        'id': id,
        'title': title,
      };

  factory Task.fromJson(Map json) => Task(
        id: json['id'],
        title: json['title'],
      );
}
