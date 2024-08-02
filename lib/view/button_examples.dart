import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Widget')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChildWidget(
              padding: 10.0,
              nameButton: '1. Elevated Button',
              button: () => ElevatedButton(
                onPressed: () => print('ElevatedButton'),
                child: const Text('Elevated Button'),
              ),
            ),
            ChildWidget(
              padding: 10.0,
              nameButton: '2. Text Button',
              button: () => TextButton(
                onPressed: () => print('Text Button'),
                child: const Text('Text Button'),
              ),
            ),
            ChildWidget(
              padding: 10.0,
              nameButton: '3. Outlined Button',
              button: () => OutlinedButton(
                onPressed: () => print('Outlined Button'),
                child: const Text('Outlined Button'),
              ),
            ),
            ChildWidget(
              padding: 10.0,
              nameButton: '4. Floating Action Button',
              button: () => FloatingActionButton(
                onPressed: () => print('Floating Action Button'),
                child: const Text('Click'),
              ),
            ),
            ChildWidget(
              padding: 10.0,
              nameButton: '5. Icon Button',
              button: () => IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () => print('Icon Button'),
                // child: const Text('Elevated Button'),
              ),
            ),
            ChildWidget(
                padding: 10.0,
                nameButton: '6. Dropdown Button',
                button: () => DropdownButton<String>(
                      value: 'One',
                      items:
                          <String>['One', 'Two', 'Three'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        print(newValue);
                      },
                    )),
            ChildWidget(
                padding: 10.0,
                nameButton: '7. Popup Menu Button',
                button: () => PopupMenuButton<String>(
                      onSelected: (String result) {
                        print(result);
                      },
                      icon: const Icon(Icons.arrow_drop_down,
                          size: 50, color: Colors.purple),
                      itemBuilder: (BuildContext context) =>
                          <String>['One', 'Two', 'Three'].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList(),
                    )),
            ChildWidget(
              padding: 10.0,
              nameButton: '8. Material Button',
              button: () => MaterialButton(
                onPressed: () => print('Material Button'),
                color: Colors.blue,
                textColor: Colors.white,
                child: const Text('Material Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final double padding;
  final String nameButton;
  final ButtonCreator button;

  // final void Function() action;

  const ChildWidget(
      {required this.padding,
      required this.nameButton,
      required this.button,
      // required this.action,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [Text(nameButton), button()],
        ),
      ),
    );
  }
}

typedef ButtonCreator = Widget Function();
