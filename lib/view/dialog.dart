import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('There is a title dialog'),
                  content: const Text('There is a content dialog'
                      'There is a content dialog'
                      'There is a content dialog'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
              child: const Text('Show Alert Dialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('There is a title dialog'),
                  children: [
                    const Text('There is a content dialog'),
                    const Text('There is a content dialog'),
                    const Text('There is a content dialog'),
                  ],
                ),
              ),
              child: const Text('Show Simple Dialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    child: Column(
                      children: [
                        Text('There is a title dialog'),
                        Text('There is a content dialog'),
                      ],
                    ),
                  ),
                ),
              ),
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
