import 'package:example_flutter_app/view/button_examples.dart';
import 'package:example_flutter_app/view/counter_page.dart';
import 'package:example_flutter_app/view/example_cubit_page.dart';
import 'package:example_flutter_app/view/example_inherited_widget.dart';
import 'package:example_flutter_app/view/getIt_example.dart';
import 'package:example_flutter_app/view/stream_demo.dart';
import 'package:example_flutter_app/view/todo_list_view.dart';
import 'package:example_flutter_app/view/ui_examples.dart';
import 'package:flutter/material.dart';

import 'button_style.dart';
import 'container_view.dart';
import 'package:example_flutter_app/view/dartz_example.dart';
import 'package:example_flutter_app/view/dio_example.dart';
import 'package:example_flutter_app/view/bottomsheet_page.dart';
import 'package:example_flutter_app/view/dialog.dart';
import 'package:example_flutter_app/view/toast.dart';
import 'package:example_flutter_app/view/webview.dart';
import 'package:example_flutter_app/view/dropdown_search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> examples = [
    {'title': 'Dropdown Search', 'page': const DropdownSearch()},
    {'title': 'GetIt Example', 'page': const GetItExample()},
    {'title': 'Bottom Sheet', 'page': const BottomSheetPage()},
    {'title': 'Basic Cubit', 'page': const CubitExamplePage()},
    {'title': 'Basic Bloc', 'page': const CounterPage()},
    {'title': 'Todo list', 'page': TodoListView()},
    {'title': 'Inherited class', 'page': const ParentPage()},
    {'title': 'Stream', 'page': const MyAppStream()},
    {'title': 'UI Widget', 'page': const MyUIWidget()},
    {'title': 'Buttons Widget', 'page': const ButtonsWidget()},
    {'title': 'Button Style', 'page': const ButtonStyleView()},
    {'title': 'Container Widget', 'page': const ContainerView()},
    {'title': 'UI Example', 'page': const MyUIWidget()},
    {'title': 'Dartz Example', 'page': const DartzExample()},
    {'title': 'Dio Example', 'page': const DioExample()},
    {'title': 'Dialog Example', 'page': const DialogExample()},
    {'title': 'Toast Example', 'page': const ToastPage()},
    {'title': 'WebView Example', 'page': const WebViewPage()},
    // Add more examples here
  ];

  int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    int totalPages = (examples.length / 5).ceil();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter App'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _currentPage > 0
                    ? () {
                        setState(() {
                          _currentPage--;
                          _selectedIndex = _currentPage * 5;
                        });
                      }
                    : null,
              ),
              Text('${_currentPage + 1} / $totalPages'),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _currentPage < totalPages - 1
                    ? () {
                        setState(() {
                          _currentPage++;
                          _selectedIndex = _currentPage * 5;
                        });
                      }
                    : null,
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      int actualIndex = _currentPage * 5 + index;
                      if (actualIndex >= examples.length) {
                        return SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            (examples[actualIndex]['title']),
                            style: TextStyle(
                              color: _selectedIndex == actualIndex
                                  ? Colors.red
                                  : Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedIndex = actualIndex;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  flex: 3,
                  child:
                      // _selectedIndex == -1
                      //     ? Center(child: Text('Select an example from the list'))
                      //     :
                      examples[_selectedIndex]['page'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
