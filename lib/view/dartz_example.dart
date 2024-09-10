import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

class DartzExample extends StatelessWidget {
  const DartzExample({Key? key}) : super(key: key);

  Either<String, int> divide(int a, int b) {
    if (b == 0) {
      return Left('Cannot divide by zero');
    } else {
      return Right(a ~/ b);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dartz Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final result = divide(10, 2);
                result.fold(
                  (error) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  ),
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Result: $value')),
                  ),
                );
              },
              child: const Text('Divide 10 by 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final result = divide(10, 0);
                result.fold(
                  (error) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  ),
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Result: $value')),
                  ),
                );
              },
              child: const Text('Divide 10 by 0'),
            ),
          ],
        ),
      ),
    );
  }
}
