import 'package:flutter/material.dart';
import 'package:flutter_todo_firebase/models/todo.dart';

class Todos with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => [..._todos];

  addTodo(String todo) {
    Todo newTodo = Todo(todo: todo, status: false);
    _todos.add(newTodo);
    notifyListeners();
  }

  setStatus(bool status, int index) {
    _todos[index].status = status;
    notifyListeners();
  }

  removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  removeAllTodo() {
    _todos.clear();
    notifyListeners();
  }
}