import 'package:dos_todos/data/datasources/todo_remote_data_source.dart';
import 'package:dos_todos/data/mappers/todo_mapper.dart';
import 'package:dos_todos/domain/entities/todo.dart';
import 'package:dos_todos/domain/repositories/todo_repository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final TodoRemoteDataSource _todoRemoteDataSource;

  ToDoRepositoryImpl(this._todoRemoteDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final todoModels = await _todoRemoteDataSource.getTodos();
    return todoModels
        .map((e) => Todo(
              id: e.id,
              title: e.title,
              isCompleted: e.isCompleted,
            ))
        .toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await _todoRemoteDataSource.addTodo(todo.toModel());
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await _todoRemoteDataSource.updateTodo(todo.toModel());
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _todoRemoteDataSource.removeTodo(id);
  }
}
