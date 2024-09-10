// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonStyleView extends StatelessWidget {
  const ButtonStyleView({super.key});

  get buttonState => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Style')),
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: TextButton.icon(
          icon: const Icon(
            Icons.add,
            size: 20,
          ),
          onPressed:
              buttonState ? null : () => print('Click text button'),
          style: TextButton.styleFrom(
              foregroundColor: Colors.pink,
              backgroundColor: Colors.green,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.blue.withOpacity(0.5),
              elevation: 20,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.white,
              side: const BorderSide(
                width: 2,
                color: Colors.red,
              )),
          label: const Text('Text Button', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
