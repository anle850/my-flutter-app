import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(const ExampleCopyWith(count: 0));

  void increment () {
    emit(ExampleCopyWith(count: state.count + 1));
  }

  void decrement () {
    emit(ExampleCopyWith(count: state.count - 1));
  }

  void reset () {
    emit(const ExampleCopyWith(count: 0));
  }
}
