import 'package:example_flutter_app/reponsitory/example_cubit/example_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitExamplePage extends StatelessWidget {
  const CubitExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExampleCubit(),
      child: BlocBuilder<ExampleCubit, ExampleState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Example Cubit')),
            body: Center(
              child: switch (state) {
                ExampleCopyWith() => Text('Count: ${state.count}'),
              },
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => context.read<ExampleCubit>().increment(),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () => context.read<ExampleCubit>().decrement(),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  child: const Icon(Icons.refresh),
                  onPressed: () => context.read<ExampleCubit>().reset(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
