import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementEvent>(
        // (IncrementEvent event, Emitter<CounterState> emit) => emit(CounterState(count: (state.count + 1))));
        (event, emit) => emit(CounterState((state.count + 1))));

    // on<IncrementEvent>(_onIncrementEvent);
    on<DecrementEvent>((event, emit) => emit(CounterState((state.count - 1))));
  }
}
// void _onIncrementEvent(IncrementEvent event, Emitter<CounterState> emit) {
//   emit(CounterState(count: state.count + 1));
// }
//
// void _onDecrementEvent(DecrementEvent event, Emitter<CounterState> emit) {
//   emit(CounterState(count: state.count - 1));
// }
// }
// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(const CounterState(0)) {
//     on<IncrementEvent>((event, emit) {
//       emit(CounterState(state.count + 1));
//     });
//     on<DecrementEvent>((event, emit) {
//       emit(CounterState(state.count - 1));
//     });
//   }
// }
