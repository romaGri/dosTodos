import 'package:dos_todos/data/models/todo_model.dart';
import 'package:firebase_database/firebase_database.dart';

const _kaDatabseName = 'todos';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(TodoModel todoModel);
  Future<void> updateTodo(TodoModel todoModel);
  Future<void> removeTodo(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseDatabase database;

  TodoRemoteDataSourceImpl({required this.database});

  @override
  Future<List<TodoModel>> getTodos() async {
    final snapshot = await database.ref().child(_kaDatabseName).once();
    final values = snapshot as Map?;

    return values?.entries
            .map((e) => TodoModel.fromJson(Map<String, dynamic>.from(e.value)))
            .toList() ??
        [];
  }

  @override
  Future<void> addTodo(TodoModel todoModel) async {
    await database
        .ref()
        .child(_kaDatabseName)
        .child(todoModel.id)
        .set(todoModel.toJson());
  }

  @override
  Future<void> updateTodo(TodoModel todoModel) async {
    await database
        .ref()
        .child(_kaDatabseName)
        .child(todoModel.id)
        .update(todoModel.toJson());
  }

  @override
  Future<void> removeTodo(String id) async {
    await database.ref().child(_kaDatabseName).child(id).remove();
  }
}
