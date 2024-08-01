import 'dart:async';

import 'package:flutter/material.dart';

class Logic {
  StreamController countController = StreamController();

  Sink get sink => countController.sink;

  Stream get stream => countController.stream;

  int count = 0;

  increase() {
    count++;
    sink.add(count);
  }

  addValue (String value) {
    sink.add(value);
  }
}

class MyAppStream extends StatefulWidget {
  const MyAppStream({super.key});

  @override
  State<MyAppStream> createState() => _MyAppStreamState();
}

class _MyAppStreamState extends State<MyAppStream> {
  Logic logic = Logic();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    logic.countController.close();
  }

  onPressed() {
    logic.increase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Stream Example')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          onChanged: ((value) => logic.addValue(value)),
        ),
        StreamBuilder(
            stream: logic.stream,
            builder: ((context, snapshot) => snapshot.hasData
                ? Text(snapshot.data.toString())
                : const CircularProgressIndicator())),
        Center(
            child: ElevatedButton(
                onPressed: onPressed, child: const Text('Click')))
      ]),
    );
  }
}
