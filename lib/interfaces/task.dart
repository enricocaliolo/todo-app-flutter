class Task {
  String title;

  Task({required this.title});

  Map toJson() => {
        'title': title,
      };

  factory Task.fromJson(Map json) => Task(
        title: json['title'],
      );
}
