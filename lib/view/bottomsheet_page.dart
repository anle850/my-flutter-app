import 'package:example_flutter_app/view/radio_example_page.dart';
import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _showPersistentBottomSheet(context),
                  child: const Text('Show Persistent BottomSheet'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _showModalBottomSheet(context),
                  child: const Text('Show Modal Bottom Sheet'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RadioExamplePage()),
                    );
                  },
                  child: const Text('Radio Example'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.blueGrey[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
            height: 200,
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Text('This is a persistent BottomSheet'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blueGrey[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 16),
              const Text(
                'This is an advanced modal bottom sheet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text('You can customize this sheet as needed'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
