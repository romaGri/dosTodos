import 'package:dos_todos/data/models/todo_model.dart';
import 'package:dos_todos/domain/entities/todo.dart';

extension TodoModelMapper on Todo {
  TodoModel toModel() {
    return TodoModel(
      id: id,
      title: title,
      isCompleted: isCompleted,
    );
  }
}

extension TodoMapper on TodoModel {
  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      isCompleted: isCompleted,
    );
  }
}
