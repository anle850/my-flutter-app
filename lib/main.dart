import 'package:example_flutter_app/reponsitory/counter_bloc/counter_bloc.dart';
import 'package:example_flutter_app/view/example_cubit_page.dart';
import 'package:example_flutter_app/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        // Add other BlocProviders here if necessary
      ],
      child: MaterialApp(
        title: 'Flutter Widget Examples',
        theme: ThemeData(
          fontFamily: 'JetBrainsMono',
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// BlocProvider(
// create: (context) => ExampleCubit(),
// child: const CubitExamplePage()),
