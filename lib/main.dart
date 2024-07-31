import 'package:example_flutter_app/view/example_cubit_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CubitExamplePage(),
          //
          // ParentPage()

      debugShowCheckedModeBanner: false,
    );
  }
}

// BlocProvider(
// create: (context) => ExampleCubit(),
// child: const CubitExamplePage()),
