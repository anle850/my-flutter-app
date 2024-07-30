import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var text = 'default';

  Future<String> textFunc() {
    return Future.delayed(const Duration(seconds: 2), (() => 'Hello world'));
  }

  bool isChanged = false;
  bool pressed = false;
  late AnimationController controller;

  onPressed() async {
    text = await textFunc();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = pressed ? 150 : 250;
    Color color = pressed ? Colors.orangeAccent : Colors.blueAccent;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: textFunc(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  var value = snapshot.data.toString();
                  return Text(value);
                }
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return Text('');
              }))
        ],
      ),
    );
  }
}
