class Todo {
  final String id;
  final String title;
  final String body;

  Todo({required this.id, required this.title, required this.body});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
