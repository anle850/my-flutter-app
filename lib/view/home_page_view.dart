import 'package:example_flutter_app/view/counter_page.dart';
import 'package:example_flutter_app/view/example_cubit_page.dart';
import 'package:example_flutter_app/view/example_inherited_widget.dart';
import 'package:example_flutter_app/view/stream_demo.dart';
import 'package:example_flutter_app/view/todo_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> examples = [
    {'title': 'Cubit example', 'page': const CubitExamplePage()},
    {'title': 'Bloc example', 'page': const CounterPage()},
    {'title': 'Todo list page', 'page': TodoListView()},
    {'title': 'Inherited Widget example', 'page': const ParentPage()},
    {'title': 'Stream example', 'page': const MyAppStream()},
    // Add more examples here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter App'),
      ),
      body: ListView.builder(
        itemCount: examples.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(examples[index]['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => examples[index]['page'],
                  // tag: examples[index]['tag'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
