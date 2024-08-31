import 'package:dos_todos/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required String id,
    required String title,
    bool isCompleted = false,
  }) : super(id: id, title: title, isCompleted: isCompleted);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
