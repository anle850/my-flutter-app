import 'package:example_flutter_app/view/button_examples.dart';
import 'package:example_flutter_app/view/counter_page.dart';
import 'package:example_flutter_app/view/example_cubit_page.dart';
import 'package:example_flutter_app/view/example_inherited_widget.dart';
import 'package:example_flutter_app/view/stream_demo.dart';
import 'package:example_flutter_app/view/todo_list_view.dart';
import 'package:example_flutter_app/view/ui_examples.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> examples = [
    {'title': 'Basic Cubit', 'page': const CubitExamplePage()},
    {'title': 'Basic Bloc', 'page': const CounterPage()},
    {'title': 'Todo list', 'page': TodoListView()},
    {'title': 'Inherited class', 'page': const ParentPage()},
    {'title': 'Stream', 'page': const MyAppStream()},
    {'title': 'UI Widget', 'page': const MyUIWidget()},
    {'title': 'Buttons Widget', 'page': const ButtonsWidget()},

    // Add more examples here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter App'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: examples.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                (examples[index]['title']).toUpperCase(),
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                    // fontFamily: 'JetBrainsMono'
                )
              ),
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
      ),
    );
  }
}
