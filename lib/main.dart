import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/model/counter_bloc/counter_bloc.dart';
import 'package:my_flutter_app/view/counter_page.dart';
import 'package:my_flutter_app/view/home_page_view.dart';
import 'package:my_flutter_app/view/stream_demo.dart';
// import 'view/todo_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

