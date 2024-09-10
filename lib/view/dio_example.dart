import 'package:example_flutter_app/setup_locator.dart';
import 'package:flutter/material.dart';
// import '../services/setup_dio.dart';
import '../services/my_service.dart';

class DioExample extends StatefulWidget {
  const DioExample({Key? key}) : super(key: key);

  @override
  State<DioExample> createState() => _DioExampleState();
}

class _DioExampleState extends State<DioExample> {
  String _responseData = 'No data';
  bool _isLoading = false;

  final myService = getIt<MyService>();

  void fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final responseData = await myService.fetchData();
      print(responseData);
      setState(() {
        _responseData = responseData;
      });
    } catch (e) {
      print('Error fetching data: ${e.toString()}');
      setState(() {
        _responseData = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MongoDB User Emails'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : fetchData,
              child: Text(_isLoading ? 'Loading...' : 'Fetch User Emails'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _responseData,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
