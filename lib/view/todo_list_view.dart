import 'package:flutter/material.dart';
import '../data/todo_controller.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final TodoController _controller = TodoController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List MVC')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(labelText: 'New Todo'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      setState(() {
                        _controller.addTodo(_textController.text);
                        _textController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controller.todos.length,
              itemBuilder: (context, index) {
                final todo = _controller.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text("${todo.title} $index"),
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (bool? value) {
                      setState(() {
                        _controller.toggleTodo(index);
                      });
                    },
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children:[
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _controller.removeTodo(index);
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            //
                            print('Edit todo at index $index');
                          },

                        ),
                      ] ,
                    ),
                  )


                );
              },
            ),
          ),
        ],
      ),
    );
  }
}