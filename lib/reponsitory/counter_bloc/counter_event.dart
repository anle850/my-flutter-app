// import 'package:equatable/equatable.dart';
part of 'counter_bloc.dart';

abstract class CounterEvent {
  // const CounterEvent();
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
