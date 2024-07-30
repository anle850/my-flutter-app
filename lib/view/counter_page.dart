import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:my_flutter_app/model/counter_bloc/counter_bloc.dart';
import '../model/counter_bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter BLoC Counter')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return (state.count == 0 ? Text(
              '${state.count}',
              style: const TextStyle(fontSize: 36),
            ) : IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (state.count == 0) {
                    print("kss");
                  }
                }));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
          ),
        ],
      ),
    );
  }
}
