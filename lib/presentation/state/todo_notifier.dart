import 'package:dos_todos/domain/entities/todo.dart';
import 'package:dos_todos/domain/repositories/todo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  final ToDoRepository _toDoRepository;

  TodoNotifier(super.state, this._toDoRepository);

  Future<void> getTodos() async {
    state = await _toDoRepository.getTodos();
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void updateTodo(Todo updatedTodo) {
    state = [
      for (final todo in state)
        if (todo.id == updatedTodo.id) updatedTodo else todo
    ];
  }

  void removeTodo(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}
