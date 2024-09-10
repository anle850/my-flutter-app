import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  _ToastPageState createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  Timer? _timer;

  void showToast() {
    debugPrint('showToast');
    Fluttertoast.showToast(
      msg: 'This is a toast message',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _startToastTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startToastTimer() {
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      showToast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Toasts will appear every 3 seconds'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showToast,
              child: Text('Show Toast Now'),
            ),
          ],
        ),
      ),
    );
  }
}
