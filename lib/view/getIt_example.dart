import 'package:flutter/material.dart';
import '../services/my_service.dart';
import '../services/my_service2.dart';
import '../setup_locator.dart';

class GetItExample extends StatelessWidget {
  const GetItExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myService = getIt<MyService>();
    final myService2 = getIt<MyService2>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetIt Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final data = await myService.fetchData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(data.toString()),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final data = await myService2.fetchData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(data.toString()),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: const Text('Fetch Data 2'),
            ),
          ],
        ),
      ),
    );
  }
}
