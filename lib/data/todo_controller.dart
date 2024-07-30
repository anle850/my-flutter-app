import '../model/todo.dart';

class TodoController {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title: title));
  }

  void toggleTodo(int index) {
    _todos[index].isDone = !_todos[index].isDone;
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
  }
}